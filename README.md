# Visor de Imágenes y Señales Médicas

Aplicación de escritorio en Python para cargar, visualizar y procesar imágenes médicas (DICOM y NIfTI), imágenes convencionales de laboratorio y señales biomédicas (.mat y .csv). Incluye inicio de sesión con roles y registro de archivos en una base de datos MySQL.

Proyecto académico de Ingeniería Biomédica, Universidad de Antioquia.

![Pantalla de inicio](capturas/login.png)

## Funcionalidades

### Inicio de sesión por roles
- Autenticación contra MySQL.
- Según el tipo de usuario, se abre el módulo de **imágenes** o el de **señales**.

### Imágenes médicas (DICOM / NIfTI)
- Carga de una carpeta de cortes DICOM y reconstrucción del volumen 3D.
- Visualización de cortes **transversal, coronal y sagital** con controles deslizantes, corrigiendo la proporción según el espaciado de píxeles y el grosor de corte.
- Consulta de metadatos principales del estudio (modalidad, fabricante, espesor de corte, dimensiones).
- Conversión de DICOM a **NIfTI** (.nii.gz) y carga de archivos NIfTI.

![Visualizador de cortes](capturas/cortes.png)

### Imágenes convencionales
- Cambio de espacio de color: RGB, escala de grises, HSV y LAB.
- Ecualización de histograma.
- Binarización con umbral ajustable.
- Operaciones morfológicas (apertura y cierre) con tamaño de kernel configurable.
- Filtro bilateral para reducir ruido conservando bordes.
- **Conteo automático de células** por detección de contornos.

![Conteo de células](capturas/celulas.png)

### Señales biomédicas (.mat)
- Exploración de las variables del archivo y su forma (canales × muestras × ensayos).
- Gráfica de un segmento por canal y ensayo.
- Promedio por canal.
- Visualización de un rango de canales superpuestos.

### Datos tabulares (.csv)
- Vista del archivo en tabla.
- Gráfico de dispersión entre dos columnas numéricas.

## Tecnologías

- **Python 3**
- **PyQt5** (interfaz gráfica diseñada con Qt Designer)
- **Arquitectura MVC**: `MODELO.py`, `VISTA.py`, `CONTROLADOR.py`
- **pydicom** y **nibabel** para imágenes médicas
- **OpenCV** para procesamiento de imágenes
- **NumPy**, **SciPy**, **pandas** y **Matplotlib** para señales y datos
- **MySQL** para usuarios y registro de archivos

## Estructura

```
├── MAIN.PY              # Punto de entrada
├── MODELO.py            # Lógica de datos: DICOM, NIfTI, imágenes, .mat, .csv y base de datos
├── VISTA.py             # Ventanas y menús de la interfaz
├── CONTROLADOR.py       # Conexión entre vista y modelo
├── *.ui                 # Diseños de las ventanas (Qt Designer)
└── res.qrc              # Recursos gráficos
```

## Cómo ejecutarlo

1. Clonar el repositorio:
   ```
   git clone https://github.com/YesidMunoz/visor-imagenes-senales-medicas.git
   cd visor-imagenes-senales-medicas
   ```
2. Instalar dependencias:
   ```
   pip install -r requirements.txt
   ```
3. Crear la base de datos ejecutando `base_datos.sql` en MySQL y ajustar los datos de conexión en `MODELO.py`. El script crea dos usuarios de prueba: `imagenes` y `senales`, ambos con contraseña `1234`.
4. Ejecutar:
   ```
   python MAIN.PY
   ```

> Los archivos DICOM de la carpeta `DICOM` son estudios de acceso público obtenidos de [nombre y enlace de la fuente].

## Autor

**Dumar Yesid Londoño Muñoz**
Estudiante de Ingeniería Biomédica · Universidad de Antioquia
[GitHub](https://github.com/YesidMunoz)
