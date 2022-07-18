---
title: HowTo GnuPG
date: 2008-09-11
author: Mauro Lizaur
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/howto-gpg-gnu-pgp.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/howto-gpg-gnu-pgp.md) |
[`.gmi`](gemini://gmi.osiux.com/howto-gpg-gnu-pgp.gmi) |
[`.html`](https://osiux.gitlab.io/howto-gpg-gnu-pgp.html)

## Instalando GnuPG

En distribuciones de GNU/Linux como Debian o Ubuntu, para instalar gnupg
y demás programas, solo hace falta ejecutar el siguiente comando:

``` {.example}
aptitude install gnupg
```

## Generando nuestra llave pública/privada

Una vez instalado, debemos generar la llave:

``` {.example}
gpg --gen-key
```

Donde debemos elegir el tipo de llave, por lo general ****DSA and
ElGamal****, es suficiente:

``` {.example}
Please select what kind of key you want:
(1) DSA and ElGamal (default)
(2) DSA (sign only)
(4) ElGamal (sign and encrypt)
(5) RSA (sign only)
Your selection? 1
```

Lo próximo será elegir el tamaño de la llave, en el ejemplo elegimos
2048 y que nunca expire. Lo recomendable es que **si** expire, al menos
dentro de un año, por si alguna vez nuestra llave se ve comprometida o
perdemos la clave o casos similares donde no podriamos volver a acceder
a esta.

``` {.example}
DSA keypair will have 1024 bits.
About to generate a new ELG-E keypair.
minimum keysize is  768 bits
default keysize is 1024 bits
highest suggested keysize is 2048 bits
What keysize do you want? (1024) 2048
Requested keysize is 2048 bits
Please specify how long the key should be valid.
0  key does not expire
<n> key expires in n days
<n>w  key expires in n weeks
<n>m  key expires in n months
<n>y  key expires in n years
Key is valid for? (0) 0
Key does not expire at all
```

Una vez completado lo anterior, nos preguntará si es correcta la
información que ingresamos, a lo cual respondemos que si.

Luego nos pedirá un nombre, un e-mail y un comentario (donde podriamos
ingresar nuestro nickname, aunque tranquilamente podríamos dejarlo
vacio) y nuestra passphrase que utilizaremos para des/encriptar, firmar
correos electronicos y archivos que queremos mantener privados.

Nota: en el momento de generar la clave, debemos generar entropía para
acelerar el proceso de la creación de la llave, la cual puede ser
generada ejecutando `ls -lR /` o `cat /dev/urandom` o ambos al mismo
tiempo :)

``` {.example}
Is this correct (y/n)? y

You need a User-ID to identify your key; the software constructs the user id
from Real Name, Comment and Email Address in this form:
"Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

Real name: Juan Carlos Petela
Email address: juanca@petela.org
Comment: jcpetela
You selected this USER-ID:
"Juan Carlos Petela (jcpetela) <juanca@petela.org>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
You need a Passphrase to protect your secret key.

Enter passphrase:
```

Una vez completado esto, veremos algo similar a:

``` {.example}
gpg: key 0D34DB33F marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0 valid: 2 signed: 1 trust: 0-, 0q, 0n, 0m, 0f, 2u
gpg: depth: 1 valid: 1 signed: 0 trust: 0-, 0q, 0n, 0m, 1f, 0u
pub 1024D/069C39A4 2008-01-28
Key fingerprint  5F6E E259 945A 0D51 32BD 1874 A46F A22D D34D B33F
uid Juan Carlos Petela (jcpetela) <juanca@petela.org>
sub 2048g/BC9EC4CB 2008-09-09
```

Ahora debemos enviar nuestra llave a algún servidor (utilizando nuestra
key-id para identificarla) para que este disponible a otros usuarios.

Nota: normalmente, con nuestracon los ultimos 8 caracteres (`D34DB33F`)
de nuestra fingerprint
(`5F6E E259 945A 0D51 32BD 1874 A46F A22D D34D B33F`) es suficiente,
pero también puede realizarse utilizando los ultimos 16
(`1874A46FA22DD34DB33F`)

``` {.example}
gpg --keyserver subkeys.pgp.net --send-key 0D34DB33F
```

En caso de olvidarnos nuestra key-id, podemos encontrarla ejecutando
cualquiera de los siguientes comandos:

``` {.example}
gpg --list-key juanca@petela.org
---
gpg --list-key juan carlos petela
```

Lo cual debería devolverlos algo similar a:

``` {.example}
pub   1024D/0D34DB33F 2008-09-09
uid                  Juan Carlos Petela (jcpetela) <juanca@petela.org>
sub   4096g/AB0B4D9C 2008-09-09
```

Donde `0D34DB33F` es nuestra `key-id`.

## Exportando nuestra llave pública

Para exportar nuestra clave debemos ejecutar:

``` {.example}
gpg --export -a 0D34DB33F
```

Y para guardarla en un archivo

``` {.example}
gpg --export -a 0D34DB33F > jcpetela.asc
```

## Agregando nuevas identidades a nuestra llave

A veces se da el caso de que tenemos mas de una cuenta de email que
utilizamos y nos gustaria que todas esas cuentas pudieran ser utilizadas
al mismo tiempo para firmar y cifrar archivos o correos electronicos.

Para lograr esto, debemos realizar lo siguiente:

``` {.example}
gpg --edit-key 0D34DB33F
```

De esta manera entraremos al menu donde debemos ejecutar `adduid`, que
de la misma manera que cuando generamos nuestras llaves, nos pedira un
nombre, un email y un comentario y luego ingresar nuestra passphrase:

``` {.example}
Orden> adduid
Nombre y apellidos: Juan Carlos Petela
Dirección de correo electrónico: juanca@gmail.com
Comentario: jcpetela
Ha seleccionado este ID de usuario:
"Juan Carlos Petela (jcpetela) <juanca@gmail.com>"

¿Cambia (N)ombre, (C)omentario, (D)irección o (V)ale/(S)alir? v

Necesita una frase contraseña para desbloquear la clave secreta
del usuario: "Juan Carlos Petela (jcpetela) <juanca@petela.org>"
clave DSA de 1024 bits, ID 0D34DB33F, creada el 2008-09-09

pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
[desconocida] (2)  Juan Carlos Petela (jcpetela) <juanca@gmail.com>
```

Si queremos modificar el estado de \'desconocida\' a \'absoluta\',
debemos hacerlo mediante el comando \'trust\'.

Primero debemos seleccionarla:

``` {.example}
Orden> 2

Por favor, decida su nivel de confianza en que este usuario
verifique correctamente las claves de otros usuarios (mirando
pasaportes, comprobando huellas dactilares en diferentes fuentes...)

1  No lo sé o prefiero no decirlo
2  NO tengo confianza
3  Confío un poco
4  Confío totalmente
5  confío absolutamente
m  volver al menú principal

¿Su decisión? 5
¿De verdad quiere asignar absoluta confianza a esta clave? (s/N) s
```

De esta manera declaramos la confianza absoluta en la nueva identidad.

Quizas el programa nos advierta lo siguiente:

****Por favor, advierta que la validez de clave mostrada no es
necesariamente correcta a menos de que reinicie el programa.****

Lo haga o no, para guardar los cambios, antes debemos ejecutar el
comando \`\`save\`\` que nos pedira la passphrase.

## Revocando nuestra llave

En caso de haber perdido o que nuestra llave se vea comprometida, lo
correcto seria revocarla para no comprometer nuesta \'\'red de
confianza\'\', que puedan decifrar archivos privados y/o firmar por
nosotros cosas que no conocemos.

Para realizar una revocacion, debemos ejecutar el siguiente comando:

``` {.example}
gpg --gen-revoke 0D34DB33F
```

Donde aparecera una pantalla donde nos preguntará la passphrase y porque
queremos revocarla.

Ahora si en nuestra llave publica tenemos varias identidades
(juanca\@petela.org y juanca\@gmail.com) y queremos borrar la cuenta de
gmail.com, solo debemos ejecutar lo siguiente:

``` {.example}
gpg --edit-key 0D34DB33F
```

De esta manera entraremos en el menu que se veria similar a esto:

``` {.example}
pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
[  absoluta ] (2)  Juan Carlos Petela (jcpetela) <juanca@gmail.com>
```

Primero debemos seleccionar la cuenta presionando **en este caso** el
numero 2, ya que ese es el identificado de nuestra cuenta en gmail.com.

Una vez realizado, veremos que el menu cambiara a:

``` {.example}
pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
[  absoluta ] (2)* Juan Carlos Petela (jcpetela) <juanca@gmail.com>
```

Ahora solo resta, ejecutar el comando `revuid` dentro de la línea de
comandos de gpg:

``` {.example}
Orden> revuid
¿Revocar realmente este identificador de usuario? (s/N) s
Por favor elija una razón para la revocación:
0  No se dio ninguna razón
4  El identificador de usuario ya no es válido
Q  Cancelar
(Probablemente quería seleccionar 4 aquí)
```

En este caso elegimos la opción 4, aunque la opción 0 también es válida.

Luego, nos pedirá una razón de porque estamos revocando la cuenta,
podemos dejar el campo vacío. Y para finalizar debemos ingresar nuestra
passphrase.

``` {.example}
¿Su decisión? 4
Introduzca una descripción opcional; acábela con una línea vacía:
> Deje de utilizar la cuenta en gmail.com
>
Razón para la revocación: El identificador de usuario ya no es válido
Deje de utilizar la cuenta en gmail.com
¿Es correcto? (s/N) s
Necesita una frase contraseña para desbloquear la clave secreta
del usuario: "Juan Carlos Petela (jcpetela) <juanca@petela.org>"
clave DSA de 1024 bits, ID 0D34DB33F, creada el 2008-09-09

Introduzca frase contraseña:
```

Una vez realizado todo esto, veremos que la cuenta de gmail.com ahora
esta marcada como `revocada`, por lo que ya no podemos seguir
utilizandola.

``` {.example}
pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
[  revocada ] (2)  Juan Carlos Petela (jcpetela) <juanca@gmail.com>
```

En caso de querer borrar nuestra identidad de la cuenta en gmail.com,
debemos ejecutar el comando `deluid` siguiendo el mismo procedimiento
que para revocarla:

``` {.example}
Orden> 2

pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
[  revocada ] (2)  Juan Carlos Petela (jcpetela) <juanca@gmail.com>

Orden> deluid
¿Borrar realmente este identificador de usuario? (s/N) s


pub  1024D/0D34DB33F  creado: 2008-09-09  uso: SC
confianza: absoluta      validez: absoluta
sub  2048g/012304CD  creado: 2008-09-09  uso: E
[  absoluta ] (1)  Juan Carlos Petela (jcpetela) <juanca@petela.org>
```

## Buscando e Importando llaves públicas ajenas

Digamos que un amigo exportó su llave pública y nos la envió en un
archivo con el nombre `rolopuente.asc`.

``` {.example}
gpg --import rolopuente.asc
```

Pero en el caso de que nuestro buen amigo Rolo Puente no tuviera tiempo
de enviarnos su llave en un archivo para simplificarnos la vida, podemos
buscarla y bajarla nosotros mismos.

Si tenemos su key-id(`1234D00D`), solo debemos hacer:

``` {.example}
gpg --keyserver x-hkp://pgp.mit.edu --recv-keys 0x1234D00D
```

O alternativamente, podemos buscarla en <http://pgp.mit.edu> y bajarla:

``` {.example}
wget -q -O - 'http://pgp.mit.edu:11371/pks/lookup?opget&search0x1234D00D ' | gpg --import
```

Si no tenemos su key-id, podemos buscarla, **averiguar cual es su key-id
actual** para no utilizar cualquier llave y repetir estos pasos.

Para buscarla debemos ejecutar:

``` {.example}
gpg --keyserver subkeys.pgp.net --search-keys rolo@puente.com.ar
```

Lo cual nos devolvería algo similar a:

``` {.example}
gpg: buscando "rolo@puente.com.ar" de hkp servidor subkeys.pgp.net
(1)     Rolo Puente <rolo@puente.com.ar>
1024 bit DSA key 0x1234D00D, creado: 2008-07-24
(1)     Rolo Puente <rolo@puente.com.ar>
1024 bit DSA key 0x1534F00D, creado: 2007-04-22
Keys 1-2 of 2 for "rolo@puente.com.ar".  Introduzca número(s), O)tro, o F)in >
```

Donde podemos ver que existe mas de una llave, quizas utilice ambas,
quizas una haya dejado de utilizarla, por eso es conveniente averiguar
cual es antes de continuar.

## Cifrando archivos

Si queremos cifrar archivos que contienen información sensible, podemos
hacerlo de la siguiente manera:

Nota: para poder enviar archivos cifrados, previamente debemos importar
la llave pública del destinatario. No es realmente necesario haber
firmado su llave pública.

Solo cifrar:

``` {.example}
gpg -o archivo_cifrado.gpg --encrypt -r rolo@puente.com.ar claves_de_root_de_la_nasa.txt
```

Solo firmar:

``` {.example}
gpg -o archivo_cifrado.gpg --sign -r rolo@puente.com.ar claves_de_root_de_la_nasa.txt
```

Firmar y cifrar:

``` {.example}
gpg -o archivo_cifrado.gpg --encrypt  --sign -r rolo@puente.com.ar claves_de_root_de_la_nasa.txt
```

Estos metodos de cifrado/firmado generaran archivos binarios, para
generar archivos ASCII (texto plano), debemos agregar la opcion
`--clearsign`

Luego para decifrar estos archivos, podemos hacerlo de la siguiente
manera:

``` {.example}
gpg --decrypt archivo_cifrado.gpg
```

## Firmando llaves

Antes que nada, es ****muy importante**** conocer a la persona que le
firmemos la llave. Incluso conociendola desde hace años, lo correcto
seria verificar que esta persona es realmente quien dice ser
comprobandolo con el DNI/Pasaporte/Indetificación de algun tipo que sea
realmente válido (Credenciales del club, tarjetas de subte,
personalmente no las considero realmente validas). En algunos casos,
algunas personas requieren dos (2) identificadores.

Mas información
[http://www.gnupg.org/howtos/es/gpg-party.html\|aca](http://www.gnupg.org/howtos/es/gpg-party.html|aca)

Habiendo hecho la introducción, veamos como firmar llaves públicas
ajenas:

``` {.example}
gpg --sign-key 0x1234D00D
```

O cualquier otro key-id que queramos firmar.

Para que esta firma este disponible en los servidores debemos ejecutar:

``` {.example}
gpg --keyserver x-hkp://pgp.mit.edu --send-keys 0x1234D00D
```

Aunque generalmente en las fiestas de firmas de llaves, se suele enviar
la llave exportada por e-mail:

``` {.example}
gpg --armor --export 0x1234D00D | mail -s "Firme tu llave" rolo@puente.com.ar
```

Luego Rolo para publicar esta firma, deberia importar el archivo con
nuestra firma en su llave y enviarlo a algun servidor de llaves pgp/gpg:

``` {.example}
gpg --import llave_firmada.asc
gpg --keyserver subkeys.pgp.net --send-key 1234D00D
```

## Otras aplicaciones para utilizar con GPG

-   Icedove/Thunderbird + Enigmal
<http://www.difundefirefox.com/extensiones/enigmail>
-   mutt + gpg <http://codesorcery.net/old/mutt/mutt-gnupg-howto>
-   kmail + gpg <http://kontact.kde.org/kmail/kmail-pgpmime-howto.php>
-   seahorse <http://www.gnome.org/projects/seahorse/index.html>
-   kgpg <http://www.secure-my-email.com/clients_kgpg.php>
-   gpgv <http://packages.debian.org/sid/gpgv>
-   signing-party <http://packages.debian.org/signing-party>
-   `caff`: CA - Fire and Forget signs and mails a key
-   `pgp-clean`: removes all non-self signatures from key
-   `pgp-fixkey`: removes broken packets from keys
-   `gpg-mailkeys`: simply mail out a signed key to its owner
-   `gpg-key2ps`: generate PostScript file with fingerprint paper strips
-   `gpglist`: show who signed which of your UIDs
-   `gpgsigs`: annotates list of GnuPG keys with already done signatures
-   `gpgparticipants`: create list of party participants for the
organiser
-   `keylookup`: ncurses wrapper around gpg --search
-   `sig2dot`: converts a list of GnuPG signatures to a .dot file
-   `springgraph`: creates a graph from a .dot file
