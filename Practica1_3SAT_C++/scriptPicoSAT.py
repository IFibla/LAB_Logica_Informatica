import math
import os
import time
import numpy as np

path = "./random3SAT/"
aux_list = [100, 150, 200, 250, 300]

list_files = sorted([f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))])
list_files_splited = [list_files[i:i+10] for i in range(0, len(list_files), 10)]

for idx, files in enumerate(list_files_splited):
    picoSAT_execution_time = []
    miniSAT_execution_time = []
    for file in files:
        start_time = time.time()
        os.system(str("picosat -v " + path + file + " > /dev/null"))
        picoSAT_execution_time.append(time.time() - start_time)

        start_time = time.time()
        os.system(str("./misat < " + path + file + " > /dev/null"))
        miniSAT_execution_time.append(time.time() - start_time)

    print("Iteration", idx, "with", aux_list[idx], "variables.")
    print("\tPicoSAT average time", np.mean(picoSAT_execution_time))
    print("\tMisatSAT average time", np.mean(miniSAT_execution_time))
    print("\tAverage difference time", np.mean([(mi-pico) for pico, mi in zip(picoSAT_execution_time, miniSAT_execution_time)]))
    print("\tMax differene time", max([(mi-pico) for pico, mi in zip(picoSAT_execution_time, miniSAT_execution_time)]))
    print("\tMax differene", max([((mi-pico)/pico) for pico, mi in zip(picoSAT_execution_time, miniSAT_execution_time)]))
