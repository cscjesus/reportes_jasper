# Pasos para trabajar con JasperReports
1. Descargar jasperstudio 7.0.3
2. Agregar al pom.xml la dependencia a jasperreports 7.0.3 ( JasperReports Library)
3. Agregar al pom.xml la dependencia mysql conector 8.4.0
## Diseno de reportes en jasper studio
### Reporte con parametros, imagen y BD
1. Iniciar sesion en Jasper Studio Community Edition
2. Crear un proyecto nuevo
3. Agregar una fuente de datos en Data Adapters "MySQL (com.mysql.jdbc.Driver)" y el drive classpath buscar el conector de mysql
>No olvidar colocar tambien el jar en la propiedades del proyecto en la opcion `Java Build Path` dentro de `Classpath` opcion `Add External JAR`
4. Agregar un reporte y en "Dataset and query builder" configurar la fuente de datos del mismo
seleccionar `Diagram` para arrastrar las tablas deseadas, seleccionar los campos deseados y  asegurarse de presionar el boton `Read Fields`.
Presionar `ok`, en `Outline`, apareceran los campos de la base de datos.
*. Revisar si existe la carpeta `src\main\resources`, de lo contrario, crearla y agregar un paquete 
llamado `reports`
*. Copiar el archivo compilado con extension `jasper` en el paquete `reportes`
*. Agregar el siguiente codigo en un boton para mostrar el reporte
```
try {
    JasperReport reporte = (JasperReport) JRLoader.loadObject(ReportesGUI.class.getResource(srcReporte));

    //String logo = "src/img/logonuevo.jpg";
//            String logo = getClass().getResource("/img/logo.png").toString();
    Map<String, Object> map = new HashMap<>();
//            map.put("logo", logo);
    reporte.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);
    JasperPrint jprint;
    if (con != null) {
        jprint = JasperFillManager.fillReport(reporte, params, con);
    } else {
        jprint = JasperFillManager.fillReport(reporte, params, new JREmptyDataSource());
    }

    JasperViewer viewer = new JasperViewer(jprint, false);
    viewer.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    viewer.setVisible(true);
} catch (JRException ex) {
    ex.printStackTrace();
}
```
- Para crear parametros en JasperSoft Studio, ir a `Outline` click derecho en `Parameter`; `Create Parameter`
- Para asignar el valor de un parametro a una Image, ir a las propiedades y dentro de `Image` ir a `Expression`, ahi asigar el valor del parametro.
> Verificar que cada que se modifique un reporte, primero se guarde antes de compilarlo en JasperStudio
> Al trabajar con una tabla, asegurarse en `Dataset and QueryBuilder Dialog` de presionar `Read Fields`.
