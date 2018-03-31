# Co to jest?
Ten projekt to połączeniu projektów BiConnectFE oraz BiConnectBE, tak aby dało się uruchomić oba jednym poleceniem.

Frontend i Backend wciąż są oddzielnymi projektami z oddzielnymi repozytoriami. Tutaj są umieszczone jedynie odnośniki do nich.

Możesz spokojnie pracować nad projektami tutaj, ale aby zacommitować jakieś zmiany fo tamtych repozytoriów musisz być w odpowiednim katalogu.

Zmiany jakich dokonasz powinny wywołać automatyczne przebudowanie serwera i po chwili zmiany powinny być widoczne w przeglądarce.

Jeżeli po twoich zmianach serwer się przewrócił to niekiedy będzie potrzebne zrestartowanie dockera.

# How to
##### clone repo
Jeżeli używasz SSH:
```bash
git clone --recurse-submodules git@github.com:gchilczuk/BiConnect.git

```

Jeżeli używasz HTTPS spróbuj:
```bash
git clone --recurse-submodules https://github.com/gchilczuk/BiConnect.git
```
…ale to może nie zadziałać. W przypdku problemów z submodułami skotaktuj się ze mną [Grzesiek], a zmienię submoduły z ssh na https (ewentualnie DIY, to prawdopodobnie tylko podmiana linków w pliku .gitmodules, ale poczytj na wszelki wypadek o submodułach: https://git-scm.com/book/en/v2/Git-Tools-Submodules).

##### run dev
Musisz mieć zainstalowane 
* Docker
* docker-compose

Będą w głównych folderze wykonaj:
```bash
docker-compose up --build
```
Poczekaj kilka minut, aż wszystko się itp. Jeżeli coś nie zadziała (backend przy pierwszym uruchomieniu może nie zaskoczyć) to przerwił działanie i uruchom jeszcze raz,
Jeżeli nie działą po drugim uruchomieniu skontaktuj się ze mną [Grzesiek]

##### use
Frontend jest dostępny pod adresem `localhost:3000`.
Backend jest dostępny pod adresem `localhost:8000`.
