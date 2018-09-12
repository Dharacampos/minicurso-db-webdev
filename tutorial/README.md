# Instalação das ferramentas

### Instalando o JDK

1. Acesse a [página de dowloads do JDK](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)
1. Encontre a versão **Java SE Development Kit 8u181**
1. Leia e aceite os termos de uso
1. Faça o download do JDK de acordo com seu sistema operacional
    ![download](img/jdkdownload.png)
1. Ao terminar o download, execute o arquivo baixado
1. No instalador, clique em __Próximo (next)__ até finalizar a instalação. Leia os termos e aceite caso apareça algum
1. Faça agora a instalação do NetBeans

### Instalando o NetBeans

1. Acesse a [página de donwloads do NetBeans](https://netbeans.org/downloads/)
1. Faça o donwload da versão Java EE
    ![Donwload Java EE](img/download.png)
1. Ao terminar o download, execute o arquivo baixado
1. No instalador, marque a opção de servidor **Apache Tomcat 8.0.27** e desmarque a outra. Clique em __Próximo (next)__
1. Leia e aceite os termos de uso
1. Aceite a pasta padrão de instalação do NetBeans e **verifique se o caminho do JDK
está correto**, caso contrário, especifique-o. Clique em __Próximo (next)__ até finalizar a instalação
    ![Caminho de instalação do JDK](img/jdkpath.png)
1. Ao fim, clique em __Finalizar (Finish)__

### Instalando o XAMPP
1. Acesse a [página de donwloads do WampServer](https://www.apachefriends.org/pt_br/download.html)
1. Fa�a o download da vers�o: **Windows/Mac/Linux, 64bit(x64) ou 32bits(x86)**
1. Fa�a a instala��o padr�o.
1. Ao final, abra o programa e ative o Apache e o MySQL.
1. No programa ainda, clique no bot�o "Admin" e certifique-se de que a p�gina
`localhost/phpmyadmin` esteja funcionando.

        Obs.: Sempre quando for usar o banco de dados, execute o �ltimo procedimento (5) para ativar o banco de dados.

### Download JSTL .jar

Fa�a o download das seguintes bibliotecas e coloque-as na pasta `lib` do seu
projeto.

1. https://mvnrepository.com/artifact/org.glassfish.web/javax.servlet.jsp.jstl/1.2.1
1. https://mvnrepository.com/artifact/javax.servlet.jsp.jstl/javax.servlet.jsp.jstl-api/1.2.1
