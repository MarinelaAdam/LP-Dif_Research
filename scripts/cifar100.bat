@echo off
setlocal enabledelayedexpansion

for /l %%i in (0, 1, 8) do (
    if %%i==0 (
        python ../train.py ^
            --root D:\Master-An1\Sem2\Research\LP-DiF\data ^
            --seed 1 ^
            --trainer LP_DiF ^
            --dataset-config-file D:\Master-An1\Sem2\Research\LP-DiF\configs\datasets\cifar100.yaml ^
            --config-file D:\Master-An1\Sem2\Research\LP-DiF\configs\trainers\LP_DiF\vit_b16.yaml ^
            --output-dir D:\Master-An1\Sem2\Research\LP-DiF\output\LP_DiF\cifar100\session0 ^
            TRAINER.TASK_ID 0
    ) else (
        set /a j=%%i-1
        python ../train.py ^
            --root D:\Master-An1\Sem2\Research\LP-DiF\data ^
            --seed 1 ^
            --trainer LP_DiF ^
            --dataset-config-file D:\Master-An1\Sem2\Research\LP-DiF\configs\datasets\cifar100.yaml ^
            --config-file D:\Master-An1\Sem2\Research\LP-DiF\configs\trainers\LP_DiF\vit_b16.yaml ^
            --output-dir D:\Master-An1\Sem2\Research\LP-DiF\output\LP_DiF\cifar100\session%%i ^
            --model-dir D:\Master-An1\Sem2\Research\LP-DiF\output\LP_DiF\cifar100\session!j! ^
            TRAINER.TASK_ID %%i
    )
)

@REM @echo off
@REM setlocal enabledelayedexpansion
@REM
@REM for /l %%i in (1, 1, 2) do (
@REM     if %%i equ 1 (
@REM         python ../train.py ^
@REM             --root D:\Master-An1\Sem2\Research\LP-DiF\\data\\ ^
@REM             --seed 1 ^
@REM             --trainer LP_DiF ^
@REM             --dataset-config-file D:\Master-An1\Sem2\Research\LP-DiF\\configs\\datasets\\cifar100.yaml ^
@REM             --config-file D:\Master-An1\Sem2\Research\LP-DiF\\configs\\trainers\\LP_DiF\\vit_b16.yaml ^
@REM             --output-dir output/LP_DiF/cifar100/session0 ^
@REM             TRAINER.TASK_ID 0
@REM     ) else (
@REM         set /a j=%%i-1
@REM         python ../train.py ^
@REM             --root D:\Master-An1\Sem2\Research\LP-DiF\\data\\ ^
@REM             --seed 1 ^
@REM             --trainer LP_DiF ^
@REM             --dataset-config-file D:\\Master-An1\\Sem2\\Research\\LP-DiF\\configs\\datasets\\cifar100.yaml ^
@REM             --config-file D:\\Master-An1\\Sem2\Research\\LP-DiF\\configs\\trainers\\LP_DiF\\vit_b16.yaml ^
@REM             --output-dir output\LP_DiF\cifar100\session%%i ^
@REM             --model-dir output\LP_DiF\cifar100\session!j! ^
@REM             TRAINER.TASK_ID %%i
@REM     )
@REM )
@REM endlocal
