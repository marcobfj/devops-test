# Test Marco Fernandez de Jauregui

## CONSTRUCCION DE IMAGEN
### REQUISITOS
- Docker version 20.10.6, build 370c289
- Clonar este repositorio con el comando ` git clone `
### CONSTRUCCION
Debemos ejecutar el siguiente comando para contruir la imagen. 
```
docker build --tag devops-test:v1 .
```


## SEGURIDAD
Para la parte de la autenticacion basica es necesario correr un contenedor extra que proveera la autenticacion basica para nuestro contenedor web. 
Pasos:
1. Ejecutar el contenedor con la aplicacion web: 
   ```
   docker run -d -p 8080:80 -m 256m --cpus=1.5 --cpuset-cpus=1 --memory-reservation=128m --network cargamos --name web devops-test:v1
   ```
2. Ejecutar el contenedor que nos proveera la autenticacion basica: 
   ```
   docker run -d -p 80:80 --link web:web --network cargamos --name auth beevelop/nginx-basic-auth
   ```

## RECURSOS 
A traves del comando 

```
docker stats
```

Podemos monitorear lso recursos de los contenedores que estan ejecucion. 

```
docker run -d -p 8080:80 -m 256m --cpus=1.5 --cpuset-cpus=1 --memory-reservation=128m --name web devops-test:v1
```


## DISTRIBUCION
- Para clonar el proyecto es necesario ejecutar: `git clone https://github.com/alejorod18/devops-jr-test`.
- Para crear una rama basada en la rama master ejecutamos: `git checkout master && git checkout -b <nombre_nueva_rama>`.
- Para poder hacer merge de la rama creada a la master primero es necesario generar un cambio en la rama creada y que este llegue hasta la etapa de commit. Posteriormente debemos ejecutar los siguientes comandos: `git checkout master && git merge rama`.
- Para subir los cambios en el repositorio remoto debemos seguis los siguientes pasos.
  1. Primero debemos verificar si el repositorio remoto existe en nuestro proyecto con el comando `git remote -v`. 
  2. Una vez realizado esto si el repositorio al que deseamos subir los cambios no existe en la lista lo agregamos con el siguiente comando `git remote add repositorio_remoto https://github.com/alejorod18/devops-jr-test`.  
  3. Despues procederemos a subir los cambios con el comando `git push origin master`. Si deseamos subir una rama que no existe en el repositorio remoto ejecutaremos: `git push --set-upstream origin <nombre_rama>`

## RED 
Para la creacion de de una red en docker es necesario ejecutar: 
```
docker network create cargamos
``` 
Y para correr el contenedor haciendo uso de esta red debemos ejecutar en contenedor con las siguientes banderas. 
```
docker run -d -p 8080:80 -m 256m --cpus=1.5 --cpuset-cpus=1 --memory-reservation=128m --network cargamos --name web devops-test:v1
```





