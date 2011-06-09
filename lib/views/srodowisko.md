#### {% title "Środowisko programisty NoSQL" %}

# NodeJS & NPM

Instalacja krok po kroku:

    git clone git://github.com/joyent/node.git
    cd node
    git checkout v0.4.8
    ./configure --prefix=$HOME/.node
    make
    make install
    git checkout master

Instalację NodeJS kończymy dodając do zmiennej *PATH* katalog *$HOME/.node/bin*.
W tym celu dopisujemy w pliku *~/.bashrc*:

    :::shell-unix-generic
    export PATH=$HOME/.node/bin:$PATH

następnie przelogowujemy się (wtedy zostaną wczytane nowe ustawienia *PATH*).

Sprawdzamy co się zainstalowało:

    cd
    node -v
    v0.4.8

OK. Teraz kolej na instalację narzędzia [NPM](http://npmjs.org/)
– a package manager for node:

    curl http://npmjs.org/install.sh | sh

Sprawdzamy instalację:

    npm -v

Powinna się wyświetlić wersja (np. `1.0.6`).


# Moduły NodeJS

Trzy przykładowe instalacje:

* CouchApp
* Kanso
* CoffeScript


## Couchapp

Użyjemy wyszukiwarki programu *npm*:

    npm search couchapp
      couchapp   Utilities for building CouchDB applications.   =mikeal
      ...

Moduł *couchapp* jest OK. Instalujemy go *globalnie* (dlaczego?):

    npm install -g couchapp
    /home/wbzyl/.node/bin/couchapp -> /home/wbzyl/.node/lib/node_modules/couchapp/bin.js
    request@1.9.5 /home/wbzyl/.node/lib/node_modules/couchapp/node_modules/request
    watch@0.3.1 /home/wbzyl/.node/lib/node_modules/couchapp/node_modules/watch
    couchapp@0.8.0 /home/wbzyl/.node/lib/node_modules/couchapp

Program *couchapp* został zainstalowany
w katalogu *$HOME/.node/bin/*, który wcześniej umieściliśmy
w *PATH*. Uruchamiamy program:

    couchapp
    couchapp -- utility for creating couchapps
    Usage:
      couchapp <command> app.js http://localhost:5984/dbname
    Commands:
      push   : Push app once to server.
      sync   : Push app then watch local files for changes.
      boiler : Create a boiler project.

Każdy skrypt dla *couchapp* powinien zaczynać się od wiersza:

    :::javascript
    require('couchapp');

Po wpisaniu tego wiersza na konsoli *node*, dostajemy:

    Error: Cannot find module 'couchapp'
    at Function._resolveFilename (module.js:320:11)

Oznacza to, że moduł/biblioteka *couchapp* nie jest w ścieżce
wyszukiwania *node*. Z tego co wypisał *npm* przy instalacji
*couchapp* wynika, że po wykonaniu poniższego polecenia:

    :::shell-unix-generic
    export NODE_PATH=$HOME/.node/lib/node_modules

moduł *couchapp* znajdzie się w ścieżce.
Sprawdzamy, czy tak jest. Jeśli tak, to dopisujemy
linijkę z *export* do pliku *$HOME/.bashrc*.


## Kanso

Korzystając z *npm* wyszukujemy Kanso:

    npm search kanso
    kanso  The surprisingly simple way to write CouchApps       =caolan
    ...

Instalujemy *Kanso* **globalnie**:

    npm install -g kanso
      .../.node/bin/kanso -> .../.node/lib/node_modules/kanso/bin/kanso
      mime@1.1.0 .../.node/lib/node_modules/kanso/node_modules/mime
      async@0.1.6 .../.node/lib/node_modules/kanso/node_modules/async
      ...

Sprawdzamy, instalację. Po wywołaniu:

    kanso

powinniśmy zobaczyć coś takiego:

    Usage: kanso COMMAND [ARGS]

    Available commands:
      push         Upload a project to a CouchDB instance
      show         Load a project and output resulting JSON
      create       Create a new project skeleton
      pushdata     Push a file or directory of JSON files to DB
      pushadmin    Upload the kanso admin app to a CouchDB instance
      autopush     Upload a project, then watch files for changes
      uuids        Returns UUIDs generated by a CouchDB instance
      help         Show help specific to a command


## Różności

* [Node.js](http://nodejs.org/)
* [Node.js Manual & Documentation](http://nodejs.org/docs/v0.4.1/api/)
* [Node.js community wiki](https://github.com/ry/node/wiki)
* [Node.js Tutorial Roundup](http://blogfreakz.com/node/node-js-tutorial-roundup/)