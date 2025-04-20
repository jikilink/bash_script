#!/bin/bash                                                                                                                        
# Переменная - дата создания архива
today=$(date +%d%m%Y)                                                                                            
# Директория папки                 
backup_dir="/var/archive/"                                                                                     
# Директория логов                
logs_dir="/var/log/"                                                                                                               
# Созданный файл                  
backup_file="backup_$today.log"                                                                                                    
# Условие проверка существует ли папка archive      
if [ -e "$backup_dir" ]; then   
    echo "Папка с бэкапом существует начинаем архивацию логов"               
    
# Проверяем существует ли архив с тем же названием
    if [ -e "$backup_dir$backup_file" ]; then                                
        echo "Бэкап с таким именем существует"                               
        exit 0                                                                    
    else                                                                            
        tar -czf $backup_file -C $logs_dir .                                         
        mv /home/ubuntu/$backup_file $backup_dir                                  
    fi                                                                      
else 
    echo "Папка с бэкапом не существует, создаем папку и архивируем логи"
    mkdir $backup_dir
    tar -czf $backup_file -C $logs_dir .
    mv /home/ubuntu/backup_file $backup_dir
fi