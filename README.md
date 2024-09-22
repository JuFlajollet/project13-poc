# project13-poc
Thirtheenth project of OpenClassrooms Java/Angular Fullstack Training Course.

## Development server

### Global Setup

_Requirements:_
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Node >= 20.14.0](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [OpenJDK21](https://openjdk.org/install/) or [Oracle JDK21](https://www.oracle.com/fr/java/technologies/downloads/#java21)
- An IDE for Java ([Eclipse](https://eclipseide.org/)/[IntelliJ](https://www.jetbrains.com/idea/download/?section=windows)/etc.)
- An IDE for Angular ([VSCode](https://code.visualstudio.com/download)/etc.)

#### Setup Back

- Clone the project (if you didn't do already):

> git clone https://github.com/JuFlajollet/project13-poc.git

- Launch your preferred IDE and open the folder of the cloned backend project.
- Select the main branch
- Check if you have correct JDK version for project (Java 21) and Maven.
- Download dependencies and build project through Maven:

> mvn clean install

- Run the application (`PocApplication.java`).

#### Setup and launch Front

- Clone the project (if you didn't do it already):

> git clone https://github.com/JuFlajollet/project13-poc.git

- Go inside front folder:

> cd front

- Install dependencies:

> npm install

- Launch Front-end:

> npm run start;

