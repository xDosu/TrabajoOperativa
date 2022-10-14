setwd(dir = "C:/Users/TOMIN/OneDrive/Escritorio")
#Import the data into R
data = read.csv("orientaciones.csv", stringsAsFactors = FALSE)
data = data$titulo_secundario
data = unlist(strsplit(data,"[ ]"))
data = gsub(",","",data)


#Convert to lower case
data = tolower(data)

#Removemos preposiciones/conectores/titulos/otras palabras
url = "https://raw.githubusercontent.com/xDosu/TrabajoOperativa/main/filter.txt"
stopwords = strsplit(readLines(url), "\n")
removeWords = which(is.element(data,stopwords)==FALSE)
data = data[removeWords]

# Grafico de frequencia
barplot(sort(table(data))[(length(table(data))-10):length( table( data ) )], las=2, main = "Titulos Secundarios", ylab = "Frecuencia")


# Palabras con su frecuencia en forma de tabla
sort(table(data))