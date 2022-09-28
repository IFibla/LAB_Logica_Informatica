#include <iostream>
#include <stdlib.h>
#include <algorithm>
#include <vector>
using namespace std;

#define UNDEF 2
#define TRUE 1
#define FALSE 0
#define TIME_TO_UPDATE 1000

class Variable {
public:
    uint8_t value;
    vector < pair < bool, uint16_t > > occurrencyList;
    int checks;
    Variable (uint16_t _id) {value = UNDEF; occurrencyList = vector < pair < bool, uint16_t > > (); checks = 0;}
    int get_heuristic_value () {if (value != UNDEF) return 0; else return (occurrencyList.size() * max(checks, 1));}
};


uint numVars;
uint numClauses;
vector<vector<int> > clauses;
vector<Variable> model;
vector<int> modelStack;
uint indexOfNextLitToPropagate;
uint decisionLevel;
uint8_t conflictes;

void readClauses()
{
    // Skip comments
    char c = cin.get();
    while (c == 'c')
    {
        while (c != '\n')
            c = cin.get();
        c = cin.get();
    }
    // Read "cnf numVars numClauses"
    string aux;
    cin >> aux >> numVars >> numClauses;
    clauses.resize(numClauses);
    conflictes = 0; 
    model = vector < Variable > ();
    for (uint i = 0; i <= numVars; ++i) {
        Variable var = Variable(i);
        model.push_back(var);
    }

    // Read clauses
    for (uint i = 0; i < numClauses; ++i)
    {
        int lit;
        while (cin >> lit and lit != 0)
        {
            clauses[i].push_back(lit);
            model[abs(lit)].occurrencyList.push_back(pair<bool, uint16_t>(bool(lit < 0), i));
        }
        sort(clauses[i].begin(), clauses[i].end());
    }

}

int currentValueInModel(int lit)
{
    if (lit >= 0)
        return model[lit].value;
    else
    {
        if (model[-lit].value == UNDEF)
            return UNDEF;
        else
            return 1 - model[-lit].value;
    }
}

void setLiteralToTrue(int lit)
{
    modelStack.push_back(lit);
    if (lit > 0)
        model[lit].value = TRUE;
    else
        model[-lit].value = FALSE;
}

void clearChecks () {
    for (uint16_t i = 1; i <= numVars; ++i )
        model[i].checks /= 2;
}

bool propagateGivesConflict()
{
    while (indexOfNextLitToPropagate < modelStack.size())
    {
        int variableIdx = abs(modelStack[indexOfNextLitToPropagate]);
        ++indexOfNextLitToPropagate;
        uint currentValue = currentValueInModel(variableIdx);
        for (uint i = 0; i < model[variableIdx].occurrencyList.size(); ++i)
        {
            pair < bool, uint16_t > pair_clause = model[variableIdx].occurrencyList[i];
            if (pair_clause.first != bool(currentValue)) continue;
            uint clause = pair_clause.second;
            bool someLitTrue = false;
            int numUndefs = 0;
            int lastLitUndef = 0;
            for (uint k = 0; not someLitTrue and k < clauses[clause].size(); ++k)
            {
                int val = currentValueInModel(clauses[clause][k]);
                if (val == TRUE)
                    someLitTrue = true;
                else if (val == UNDEF)
                {
                    ++numUndefs;
                    lastLitUndef = clauses[clause][k];
                }
            }
            if (not someLitTrue and numUndefs == 0) {
                model[variableIdx].checks += 1;
                if (++conflictes % TIME_TO_UPDATE == 0) clearChecks();
                return true; // conflict! all lits false
            }
            else if (not someLitTrue and numUndefs == 1)
                setLiteralToTrue(lastLitUndef);
        }
    }
    return false;
}

void backtrack()
{
    uint i = modelStack.size() - 1;
    int lit = 0;
    while (modelStack[i] != 0)
    { // 0 is the DL mark
        lit = modelStack[i];
        model[abs(lit)].value = UNDEF;
        modelStack.pop_back();
        --i;
    }
    // at this point, lit is the last decision
    modelStack.pop_back(); // remove the DL mark
    --decisionLevel;
    indexOfNextLitToPropagate = modelStack.size();
    setLiteralToTrue(-lit); // reverse last decision
}

// Heuristic for finding the next decision literal:
int getNextDecisionLiteral()
{
    int topVariableIdx = 1;
    int topHeuristicValue = model[1].get_heuristic_value();
    model[1].checks = 0;
    for (uint i = 2; i <= numVars; ++i) {// stupid heuristic:
        if (model[i].get_heuristic_value() > topHeuristicValue) {
            topHeuristicValue = model[i].get_heuristic_value();
            topVariableIdx = i;
        }
    }
    if (topHeuristicValue == 0) return 0;
    return topVariableIdx;         
}

void checkmodel()
{
    for (uint i = 0; i < numClauses; ++i)
    {
        bool someTrue = false;
        for (uint j = 0; not someTrue and j < clauses[i].size(); ++j)
            someTrue = (currentValueInModel(clauses[i][j]) == TRUE);
        if (not someTrue)
        {
            cout << "Error in model, clause is not satisfied:";
            for (uint j = 0; j < clauses[i].size(); ++j)
                cout << clauses[i][j] << " ";
            cout << endl;
            exit(1);
        }
    }
}

int main()
{
    readClauses(); // reads numVars, numClauses and clauses

    
    indexOfNextLitToPropagate = 0;
    decisionLevel = 0;

    // Take care of initial unit clauses, if any
    for (uint i = 0; i < numClauses; ++i)
        if (clauses[i].size() == 1)
        {
            int lit = clauses[i][0];
            int val = currentValueInModel(lit);
            if (val == FALSE)
            {
                cout << "UNSATISFIABLE" << endl;
                return 10;
            }
            else if (val == UNDEF)
                setLiteralToTrue(lit);
        }

    // DPLL algorithm
    while (true)
    {
        while (propagateGivesConflict())
        {
            if (decisionLevel == 0)
            {
                cout << "UNSATISFIABLE" << endl;
                return 10;
            }
            backtrack();
        }
        int decisionLit = getNextDecisionLiteral();
        if (decisionLit == 0)
        {
            checkmodel();
            cout << "SATISFIABLE" << endl;
            return 20;
        }
        // start new decision level:
        modelStack.push_back(0); // push mark indicating new DL
        ++indexOfNextLitToPropagate;
        ++decisionLevel;
        setLiteralToTrue(decisionLit); // now push decisionLit on top of the mark
    }
}
