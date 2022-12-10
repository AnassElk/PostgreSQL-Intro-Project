Contributeurs : Anass El Kettani et Dylane Chikhoune
    Assurez-vous d'avoir installé la version 14 PostgreSQL.
    Assurez-vous d'avoir installé la version 16 de Node.
    Allez dans /client et lancez la commande npm install dans un terminal.
    Allez dans /server et lancez la commande npm install dans un terminal.
    Allez dans /server/app/services/database.service.ts et modifiez connectionConfig avec les bons paramètres de votre BD.
    Allez dans /server et faites la commande ng serve --open dans un terminal. Le serveur est lancé au localhost:3000 par défaut.
    Allez dans /client et faites la commande npm start dans un terminal. Le client est lancé au localhost:4200 par défaut.

Configuration de la base de données : 
    -Créer la nouvelle base de donnees avec comme user postgres
    -En suivant ces étapes créer un mot de passe : Login/Group Roles -> Click droit sur postgres -> Properties -> Definition. Nommez le mot de passe root
    - Dans le fichier database.service.ts, assurez vous d'avoir cette configuration :
    user: "postgres",
    database: <nomBD>,
    password: "root",
    port: 5432,
    host: "127.0.0.1",
    keepAlive: true,
