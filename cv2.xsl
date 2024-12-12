<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="category" select="'Analityk finansowy'"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>&lt;style&gt;
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 20px;
                        line-height: 1.8;
                        background-color:rgba(0, 0, 0, 0.1);
                        color: #333;
                    }
                    h1 {
                        color: #ff6600;
                        border-bottom: 3px  rgb(255, 255, 255);
                        padding-bottom: 10px;
                        margin-bottom: 20px;
                    }
                    h2 {
                        color:  #ff6600;
                        margin-top: 30px;
                        margin-bottom: 10px;
                    }
                    ul {
                        list-style: square;
                        margin-left: 20px;
                    }
                    .section {
                        padding: 15px;
                        margin-bottom: 25px;
                        background: rgba(0, 0, 0, 0.1);
                        border-radius: 8px;
                        box-shadow: 0 2px 6px rgb(255, 255, 255);
                    }
                    img {
                        max-width: 150px;
                        border-radius: 10px;
                        margin: 10px 0;
                        box-shadow: 0 2px 4px rgb(255, 255, 255);
                    }
                    p, li {
                        margin: 5px 0;
                    }
                &lt;/style&gt;</style>
                <title>CV - Data Science</title>
            </head>
            <head>
                <style>
                    .section {
                        margin-bottom: 20px;
                    }
                    .osoba-info {
                        display: flex; /* Używamy flexbox do wyświetlania obok siebie */
                        align-items: center; /* Wyrównujemy elementy w pionie */
                        gap: 20px; /* Dajemy odstęp między zdjęciem a danymi */
                    }
                    .osoba-zdjecie img {
                        border-radius: 50%; /* Jeśli chcesz, żeby zdjęcie było okrągłe */
                        width: 100px; /* Ustalamy szerokość zdjęcia */
                        height: 100px; /* Ustalamy wysokość zdjęcia */
                    }
                    .osoba-dane {
                        display: flex;
                        flex-direction: column; /* Wyświetlamy dane w kolumnie */
                    }
                    .osoba-dane p {
                        margin: 5px 0; /* Odstęp między danymi */
                    }
                </style>
            </head>
            <body>
                <div class="section">
                    <h2>Osoba</h2>
                    <img src="{CV/Osoba/Zdjęcie}" alt="Zdjęcie" />
                    <p><b>Imię:</b> <xsl:value-of select="CV/Osoba/Imię"/></p>
                    <p><b>Nazwisko:</b> <xsl:value-of select="CV/Osoba/Nazwisko"/></p>
                    <p><b>Email:</b> <xsl:value-of select="CV/Osoba/Kontakt/Email"/></p>
                    <p><b>Telefon:</b> <xsl:value-of select="CV/Osoba/Kontakt/Telefon"/></p>
                    <p><b>Adres:</b> <xsl:value-of select="CV/Osoba/Kontakt/Adres"/></p>
                </div>
                <div class="section">
                    <h2>O mnie</h2>
                    <p><xsl:value-of select="CV/Sekcje/O_mnie/Opis"/></p>
                </div>
                <h1>Informacje dla kategorii: <xsl:value-of select="$category"/></h1>
                
                <h2>Doświadczenie zawodowe</h2>
                <ul>
                    <xsl:apply-templates select="CV/Sekcje/Doświadczenie/Pozycja[KategoriaPracy=$category]" mode="experience"/>
                </ul>
                
                <h2>Umiejętności</h2>
                <ul>
                    <xsl:apply-templates select="CV/Sekcje/Umiejętności/Kategoria[KategoriaPracy=$category]" mode="skills"/>
                </ul>
                
                <h2>Wykształcenie</h2>
                <ul>
                    <xsl:apply-templates select="CV/Sekcje/Wykształcenie/Pozycja[KategoriaPracy=$category]" mode="education"/>
                </ul>
                
                <h2>Projekty</h2>
                <ul>
                    <xsl:apply-templates select="CV/Sekcje/Projekty/Projekt[KategoriaPracy=$category]" mode="projects"/>
                </ul>
            </body>
        </html>
    </xsl:template><xsl:template match="Pozycja" mode="experience">
        <li>
            <b>Stanowisko:</b> <xsl:value-of select="Stanowisko"/> w <xsl:value-of select="Firma"/>
            (<xsl:value-of select="Okres"/>)
            <ul>
                <xsl:for-each select="Obowiązki/Obowiązek">
                    <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:template><xsl:template match="Kategoria" mode="skills">
        <li>
            <b><xsl:value-of select="Nazwa"/>:</b> <xsl:value-of select="Opis"/>
        </li>
    </xsl:template><xsl:template match="Pozycja" mode="education">
        <li>
            <b>Szkoła:</b> <xsl:value-of select="Szkoła"/>
            (<xsl:value-of select="Okres"/>) - <xsl:value-of select="Stopień"/>
        </li>
    </xsl:template><xsl:template match="Projekt" mode="projects">
        <li>
            <b>Nazwa:</b> <xsl:value-of select="Nazwa"/>
            <ul>
                <xsl:for-each select="Opis/Punkt">
                    <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:template></xsl:stylesheet>
