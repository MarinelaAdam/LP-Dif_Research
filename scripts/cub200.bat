@echo off
setlocal enabledelayedexpansion

for /l %%i in (1, 1, 3) do (
    if %%i equ 1 (
        python ../train.py ^
            --root D:\\Alex\\Desktop\\LP-DiF-main\\data\\ ^
            --seed 1 ^
            --trainer LP_DiF ^
            --dataset-config-file D:\\Alex\\Desktop\\LP-DiF-main\\configs\\datasets\\cub200.yaml ^
            --config-file D:\\Alex\\Desktop\\LP-DiF-main\\configs\\trainers\\LP_DiF\\vit_b16.yaml ^
            --output-dir output/LP_DiF/cub200/session0 ^
            TRAINER.TASK_ID 0
    ) else (
        set /a j=%%i-1
        python ../train.py ^
            --root D:\\Alex\\Desktop\\LP-DiF-main\\data\\ ^
            --seed 1 ^
            --trainer LP_DiF ^
            --dataset-config-file D:\\Alex\\Desktop\\LP-DiF-main\\configs\\datasets\\cub200.yaml ^
            --config-file D:\\Alex\\Desktop\\LP-DiF-main\\configs\\trainers\\LP_DiF\\vit_b16.yaml ^
            --output-dir output/LP_DiF/cub200/session%%i ^
            --model-dir output/LP_DiF/cub200/session!j! ^
            TRAINER.TASK_ID %%i
    )
)
endlocal
