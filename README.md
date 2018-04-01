# Co to jest?
Ten projekt to połączeniu projektów BiConnectFE oraz BiConnectBE, tak aby dało się uruchomić oba jednym poleceniem.

Frontend i Backend wciąż są oddzielnymi projektami z oddzielnymi repozytoriami, musisz je ręcznie umieścić w katalogu BiConnect.
Struktrua katalogów powinna wyglądać tak:

```text
.
├── BiConnect
│   ├── BiConnectBE
│   ├── BiConnectFE
│   ├── .gitignore
│   ├── backend.Dockerfile
│   ├── BiCon_create.sql
│   ├── docker-compose.yml
│   └── README.md
```
 
Po uruchomieniu kontenerów zmiany jakich dokonasz powinny wywołać automatyczne przebudowanie serwera i po chwili powinny być widoczne w przeglądarce.

Jeżeli po twoich zmianach serwer się „przewrócił” to niekiedy będzie potrzebne zrestartowanie dockera.

# How to
#### run dev
Musisz mieć zainstalowane 
* Docker
* docker-compose

Będąc w głównym katalogu wykonaj:
```bash
docker-compose up --build
```
Poczekaj kilka minut, aż wszystko się zbuduje, uruchomi itp. Jeżeli coś nie zadziała (backend przy pierwszym uruchomieniu może nie zaskoczyć) to przerwij działanie i uruchom jeszcze raz,
Jeżeli nie działa po drugim uruchomieniu skontaktuj się ze mną [Grzesiek].

#### use
Po uruchomieniu:
Frontend jest dostępny pod adresem `localhost:3000`.
Backend jest dostępny pod adresem `localhost:8000`.
