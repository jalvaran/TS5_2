<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of html_est Clase para generar codigo html dentro de php
 *
 * @author Wilson
 */
class html_est {
    
    /**
     * Metodo que indica el tipo de rendreizacon del html
     */
    function tipo_html(){
        
        print('<!DOCTYPE html>');
        
    } 
    
    /**
     * Metodo html para definir el cuerpo del html
     * @param type $lang ->atr. lang del elemento html lenguage con el cual estara definido al html
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function html($lang,$vectorhtml){
        
        print('<html lang="'.$lang.'">');
    }
    
    /**
     * Metodo Chmtl para cerrar el cuerpo del html
     */
    function Chtml(){
        
        print('</html>');
    }
    
    /**
     * Metodo head para el area head de la pagina
     */
    function head(){
         
        print('<head>');
     }
     
    /**
     * Metodo Chead para el cierre del area head de la pagina
     */
    function Chead(){
         
        print('</head>');
     }
     
     /**
      * Metodo meta para definir los metadatos de la pagina
      * @param type $name ->atr. lang del elemento meta
      * @param type $content ->atr. content del elemento meta
      * @param type $charset ->atr. charset del elemento meta
      * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
      */
     function meta($name,$content,$charset,$vectorhtml){
         
         print('<meta name="'.$name.'" content="'.$content.'" name="'.$charset.'" >');
     }
     
     /**
     * Metodo title para el definir el title dentro del head de la pagina
     */
    function title(){
         
        print('<title>');
     }
     
     /**
     * Metodo Ctitle para el cierre del title dentro del head de la pagina
     */
    function Ctitle(){
         
        print('</title>');
     }
     
     /**
      * Metodo link para el enlace a un recurso externo dentro del head
      * @param type $rel ->atr. rel del elemento link
      * @param type $href ->atr. hret del elemento link
      * @param type $type ->atr. type del elemento link
      * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
      */
    function link($rel,$href,$type,$vectorhtml){
         
        print('<link rel="'.$rel.'" href="'.$href.'" type="'.$type.'" >');
     }
     
    /**
     * Metodo style para definir estilos en el documento
     * @param type $type ->atr. type del elemento style
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */ 
    function style($type,$vectorhtml){
         
        print('<style type="'.$type.'">'); 
     }
     
    /**
     * Metodo Cstyle para cerrar los estilos  en el documento
     */ 
    function Cstyle(){
         
        print('</style>');   
     }
     
    /**
     * Metodo base para URL predeterminada y un destino predeterminado para todos los enlaces en una página
     * @param type $href ->atr. href del elemento base
     * @param type $target ->atr. traget del elemento base
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function base($href,$target,$vectorhtml){
       
         print('<base href="'.$href.'" target="'.$target.'" >');
     }
    
     /**
     * Metodo script para definir un script o apunta a un archivo de script externo a través del atributo src
     * @param type $src -> atr. src del elemneto script
     * @param type $type -> atr. type del elemneto script
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */ 
    function script($src,$type,$vectorhtml){
        
         print('<script src="'.$src.'" type="'.$type.'" >');
    } 
    
    /**
     * Metodo Cscript para cerrar los script en el documento
     */
    function Cscript(){
        
         print('</script>');
    }
    
    /**
     * Metodo noscript para mostrar que la paguna nosoporta javascript
     */
    function noscript(){
        
         print('<noscript>');
    }
    
    /**
     * Metodo Cnoscript para cerrar el contenido el noscript
     */
    function Cnoscript(){
        
         print('</noscript>');
    }
    
    /**
     *Metodo body para el cuerpo de la pagina
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)  
     */
    function body($vectorhtml){
        
         print('<body>');
    }
    
    /**
     *Metodo Cbody para cerrar el cuerpo de la pagina  
     */
    function Cbody(){
        
         print('</body>');
    }
    
    /**
     * Metodo div para crear contenedores
     * https://www.w3schools.com/tags/tag_div.asp 
     * @param type $id ->atr global. id del elemento div
     * @param type $class ->atr global. class del elemento div
     * @param type $hidden ->atr global. class del elemento div
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function div($id,$class,$hidden,$vectorhtml){
        
         print('<div id="'.$id.'" class="'.$class.'" hidden="'.$hidden.'" >');
        
    }
    
    /**
     * Metodo Cdiv para cerrar contenedores
     */
    function Cdiv(){
        
         print('</div>');
        
    }
    
    /**
     * Metodo h1 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h1
     * @param type $class ->atr global. id del elemento h1
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h1($id,$class,$vectorhtml){
        
         print('<h1 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch1 para cerra una etiqueta
     */
    function Ch1(){
        
         print('</h1>');
        
        
    }
    
    /**
     * Metodo h2 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h2
     * @param type $class ->atr global. id del elemento h2
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h2($id,$class,$vectorhtml){
        
         print('<h2 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch2 para cerra una etiqueta
     */
    function Ch2(){
        
         print('</h2>');
        
        
    }
    
    /**
     * Metodo h3 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h3
     * @param type $class ->atr global. id del elemento h3
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h3($id,$class,$vectorhtml){
        
         print('<h3 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch3 para cerra una etiqueta
     */
    function Ch3(){
        
         print('</h3>');
        
        
    }
    
    /**
     * Metodo h4 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h4
     * @param type $class ->atr global. id del elemento h4
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h4($id,$class,$vectorhtml){
        
         print('<h4 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch4 para cerra una etiqueta
     */
    function Ch4(){
        
         print('</h4>');
        
        
    }
    
    /**
     * Metodo h5 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h5
     * @param type $class ->atr global. id del elemento h5
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h5($id,$class,$vectorhtml){
        
         print('<h5 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch5 para cerra una etiqueta
     */
    function Ch5(){
        
         print('</h5>');
        
        
    }
    
    /**
     * Metodo h6 para etiquetas
     * https://www.w3schools.com/tags/tag_hn.asp
     * @param type $id ->atr global. id del elemento h6
     * @param type $class ->atr global. id del elemento h6
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function h6($id,$class,$vectorhtml){
        
         print('<h6 id="'.$id.'" class="'.$class.'" >');
        
        
    }
    
    /**
     * Metodo Ch6 para cerra una etiqueta
     */
    function Ch6(){
        
         print('</h6>');
        
        
    }
    
    /**
     * Metodo p para parrafos
     * https://www.w3schools.com/tags/tag_p.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function p($id,$class,$vectorhtml){
        
         print('<p id="'.$id.'" class="'.$class.'" >');

    
    }
    
    /**
     * Metodo Cp para cerrar parrafos
     */
    function Cp(){
        
         print('</p>');
        
        
    }
    
    /**
     * Metodo a para hipervinculos
     * https://www.w3schools.com/tags/tag_a.asp
     * @param type $id ->atr global. id del elemento a
     * @param type $class ->atr global. class del elemento a
     * @param type $href ->atr. href del elemento a
     * @param type $target ->atr. target del elemento a
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function a($id,$class,$href,$target,$vectorhtml){
        
         print('<p id="'.$id.'" class="'.$class.'" href="'.$$href.'" target="'.$target.'" >');
    
    
    }
    
     /**
     * Metodo Ca para cerrar vinculos
     */
    function Ca(){
        
         print('</a>');
        
        
    }
    
     /**
     * Metodo span
     * https://www.w3schools.com/tags/tag_span.asp 
     * @param type $id ->atr global. id del elemento span
     * @param type $class ->atr global. id del elemento span
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function span($id,$class,$vectorhtml){
        
        print('<span id="'.$id.'" class="'.$class.'" >');
    }
    
     /**
     * Metodo Cspan para cerrar 
     */
    function Cspan(){
        
         print('</span>');
        
    }
    
    /**
     * Metodo strong para resaltar
     * https://www.w3schools.com/tags/tag_strong.asp 
     * @param type $id ->atr global. id del elemento strong
     * @param type $class ->atr global. id del elemento strong
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function strong($id,$class,$vectorhtml){
        
         print('<strong id="'.$id.'" class="'.$class.'" >');
        
    }
    
     /**
     * Metodo Cstrong para cerrar strong
     */
    function Cstrong(){
        
         print('</strong>');
        
    }
    
    /**
     * Metodo i
     * https://www.w3schools.com/tags/tag_i.asp  
     * @param type $id ->atr global. id del elemento i
     * @param type $class ->atr global. class del elemento i
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function i($id,$class,$vectorhtml){
        
         print('<i id="'.$id.'" class="'.$class.'" >');
        
    }
    
     /**
     * Metodo Ci para cerrar
     */
    function Ci(){
        
         print('</i>');
        
    }
    
    /**
     * Metodo form para formularios 
     * https://www.w3schools.com/tags/tag_form.asp
     * @param type $id ->atr global. id del elemento form
     * @param type $class ->atr global. class del elemento form
     * @param type $method ->atr. method del elemento form
     * @param type $action ->atr. action del elemento form
     * @param type $target ->atr. target del elemento form
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function form($id,$class,$method,$action,$target,$vectorhtml){
        
        print('<form id="'.$id.'" class="'.$class.'" method="'.$method.'" action="'.$action.'" target="'.$target.'" >');
    }
    
    /**
     * Metodo Cform para cerra el formulario
     */
    function Cform(){
        
        print('</form>');
        
    }
    
    /**
     * Metodo input para definir campo de entrada
     * https://www.w3schools.com/tags/tag_input.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $type ->atr. type del elemento input
     * @param type $name ->atr. name del elemento input
     * @param type $title ->atr global. id
     * @param type $value ->atr. value del elemento input
     * @param type $placeholder ->atr. placeholder del elemento input
     * @param type $required ->atr. required del elemento input
     * @param type $hidden ->atr global. hidden
     * @param type $autocomplete ->atr. autocomplete del elemento input
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function input($id,$class,$type,$name,$title,$value,$placeholder,$required,$hidden,$autocomplete,$vectorhtml){
        
        print('<input id="'.$id.'" class="'.$class.'" type="'.$type.'" name="'.$name.'" title="'.$title.'" value="'.$value.'" placeholder="'.$placeholder.'" required="'.$required.'" hidden="'.$hidden.'" autocomplete="'.$autocomplete.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo texarea para definir campo de entrada texto largo
     * https://www.w3schools.com/tags/tag_textarea.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $name ->atr. name del elemento texarea
     * @param type $title ->atr global. id
     * @param type $placeholder ->atr. placeholder del elemento texarea
     * @param type $required ->atr. required del elemento texarea
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function texarea($id,$class,$name,$title,$placeholder,$required,$hidden,$vectorhtml){
        
        print('<texarea id="'.$id.'" class="'.$class.'" name="'.$name.'" title="'.$title.'" placeholder="'.$placeholder.'" required="'.$required.'" hidden="'.$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo Ctexarea para cerra el texarea
     */
    function Ctexarea(){
        
        print('</texarea>');
        
    }
    
    /**
     * Metodo boton para definir campo de boton
     * https://www.w3schools.com/tags/tag_button.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $type ->atr. type del elemento boton
     * @param type $name ->atr. name del elemento boton
     * @param type $title ->atr global. id
     * @param type $value ->atr. value del elemento boton
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function boton($id,$class,$type,$name,$title,$value,$hidden,$vectorhtml){
        
        print('<boton id="'.$id.'" class="'.$class.'" type="'.$type.'" name="'.$name.'" title="'.$title.'" value="'.$value.'" hidden="'.$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo Cboton para cerra el boton
     */
    function Cboton(){
        
        print('</boton>');
        
    }
    
     /**
     * Metodo select para definir seleccion
     * https://www.w3schools.com/tags/tag_select.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $name ->atr. name del elemento select
     * @param type $title ->atr global. id
     * @param type $required ->atr. required del elemento select
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function select($id,$class,$name,$title,$required,$hidden,$vectorhtml){
        
        print('<select id="'.$id.'" class="'.$class.'" name="'.$name.'" title="'.$title.'" required="'.$required.'" hidden="'.$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cselect para cerra el select
     */
    function Cselect(){
        
        print('</select>');
        
    }
    
    /**
     * Metodo datalist para definir seleccion con autocompletado
     * https://www.w3schools.com/tags/tag_datalist.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $title ->atr global. id
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function datalist($id,$class,$title,$hidden,$vectorhtml){
        
        print('<datalis id="'.$id.'" class="'.$class.'" title="'.$title.'" hidden="'.$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo Cdatalist para cerra el datalist
     */
    function Cdatalist(){
        
        print('</datalist>');
        
    }
    
     /**
     * Metodo option para definir opciones
     * https://www.w3schools.com/tags/tag_option.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $title ->atr global. id
     * @param type $value ->atr. value del elemento option
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function option($id,$class,$title,$value,$hidden,$vectorhtml){
        
        print('<option id="'.$id.'" class="'.$class.'" title="'.$title.'" value="'.$value.'" hidden="'.$$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Coption para cerra el option
     */
    function Coption(){
        
        print('</option>');
        
    }
    
     /**
     * Metodo optgroup para definir opciones grupales
     * https://www.w3schools.com/tags/tag_optgroup.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $title ->atr global. id
     * @param type $label ->atr. value del elemento optgroup
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function optgroup($id,$class,$title,$label,$hidden,$vectorhtml){
        
        print('<optgroup id="'.$id.'" class="'.$class.'" title="'.$title.'" label="'.$label.'" hidden="'.$$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Coptgroup para cerra el optgroup
     */
    function Coptgroup(){
        
        print('</optgroup>');
        
    }
    
     /**
     * Metodo fieldset se usa para agrupar elementos relacionados en un formulario
     * https://www.w3schools.com/tags/tag_fieldset.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $name ->atr. name del elemento fieldset
     * @param type $title ->atr global. id
     * @param type $hidden ->atr global. hidden
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function fieldset($id,$class,$name,$title,$hidden,$vectorhtml){
        
        print('<fieldset id="'.$id.'" class="'.$class.'" name="'.$name.'" title="'.$title.'" hidden="'.$hidden.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cfieldset para cerra el fieldset
     */
    function Cfieldset(){
        
        print('</fieldset>');
        
    }
    
    /**
     * Metodo legend define un título para el elemento <fieldset> 
     * https://www.w3schools.com/tags/tag_legend.asp
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function legend($vectorhtml){
        
        print('<legend vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo Clegend para cerra el legend
     */
    function Clegend(){
        
        print('</legend>');
        
    }
    
     /**
     * Metodo label define una etiqueta para un elemento <input>
     * https://www.w3schools.com/tags/tag_label.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $for ->atr. name del elemento label
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function label($id,$class,$for,$vectorhtml){
        
        print('<label id="'.$id.'" class="'.$class.'" for="'.$for.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo Clabel para cerra el label
     */
    function Clabel(){
        
        print('</label>');
        
    }
    
    /**
     * Metodo header para definir cabecera
     * https://www.w3schools.com/tags/tag_header.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function header($id,$class,$vectorhtml){
        
        print('<header id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cheader para cerra la cabecera
     */
    function Cheader(){
        
        print('</header>');
    
    }
    
    /**
     * Metodo nav para definir menus o enlaces de navegacion
     * https://www.w3schools.com/tags/tag_nav.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function nav($id,$class,$vectorhtml){
        
        print('<nav id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cnav para cerra la menus
     */
    function Cnav(){
        
        print('</nav>');
    
    }
    
    /**
     * Metodo section define secciones en un documento, como capítulos, encabezados, pies de página o cualquier otra sección del documento
     * https://www.w3schools.com/tags/tag_section.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function section($id,$class,$vectorhtml){
        
        print('<section id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Csection para cerra las section
     */
    function Csection(){
        
        print('</section>');
    
    }
    
    /**
     * Metodo article define especifica contenido independiente y autónomo
     * https://www.w3schools.com/tags/tag_article.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function article($id,$class,$vectorhtml){
        
        print('<article id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Carticle para cerra los article
     */
    function Carticle(){
        
        print('</article>');
    
    }
    
    /**
     * Metodo aside define algún contenido aparte del contenido en el que se coloca.
     * https://www.w3schools.com/tags/tag_aside.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function aside($id,$class,$vectorhtml){
        
        print('<aside id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Carticle para cerra los article
     */
    function Caside(){
        
        print('</aside>');
    
    }
    
    /**
     * Metodo footer define un pie de página para un documento o sección.
     * https://www.w3schools.com/tags/tag_footer.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function footer($id,$class,$vectorhtml){
        
        print('<footer id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Carticle para cerra los article
     */
    function Cfooter(){
        
        print('</footer>');
    
    }
    
    /**
     * Metodo br para saltos de linea
     */
    function br(){
        
         print('<br>');
    }
    
     /**
     * Metodo table define una tabla HTML
     * https://www.w3schools.com/tags/tag_table.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function table($id,$class,$vectorhtml){
        
        print('<table id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctable para cerra la tabla
     */
    function Ctable(){
        
        print('</table>');
    
    }
    
    /**
     * Metodo tr define una fila en una tabla HTML
     * https://www.w3schools.com/tags/tag_tr.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $colspan ->atr. colspan del elemento tr
     * @param type $rowspan ->atr. rowspan del elemento tr
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function tr($id,$class,$colspan,$rowspan,$vectorhtml){
        
        print('<tr id="'.$id.'" class="'.$class.'" colspan="'.$colspan.'" rowspan="'.$rowspan.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctr para cerra la fila
     */
    function Ctr(){
        
        print('</tr>');
    
    }
    
    /**
     * Metodo td define una columna en una tabla HTML
     * https://www.w3schools.com/tags/tag_td.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $colspan ->atr. colspan del elemento td
     * @param type $rowspan ->atr. rowspan del elemento td
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function td($id,$class,$colspan,$rowspan,$vectorhtml){
        
         print('<td id="'.$id.'" class="'.$class.'" colspan="'.$colspan.'" rowspan="'.$rowspan.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctd para cerra la columna
     */
    function Ctd(){
        
        print('</td>');
    
    }
    
     /**
     * Metodo th define el encabezado de celda
     * https://www.w3schools.com/tags/tag_th.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $colspan ->atr. colspan del elemento th
     * @param type $rowspan ->atr. rowspan del elemento th
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function th($id,$class,$colspan,$rowspan,$vectorhtml){
        
         print('<td id="'.$id.'" class="'.$class.'" colspan="'.$colspan.'" rowspan="'.$rowspan.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctr para cerra el en cabezado de la fila
     */
    function Cth(){
        
        print('</th>');
    
    }
    
     /**
     * Metodo caption define una leyenda de tabla, La etiqueta <caption> debe insertarse inmediatamente después de la etiqueta <table>
     * https://www.w3schools.com/tags/tag_caption.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function caption($id,$class,$vectorhtml){
        
        print('<caption id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ccaption para cerra la leyenda <caption> 
     */
    function Ccaption(){
        
        print('</caption>');
    
    }
    
    /**
     * Metodo thead  se usa para agrupar el contenido del encabezado en una tabla HTML
     * https://www.w3schools.com/tags/tag_thead.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function thead($id,$class,$vectorhtml){
        
        print('<thead id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cthead para cerra el contenido del encabezado de tabla </thead>
     */
    function Cthead(){
        
        print('</thead>');
    
    }
    
     /**
     * Metodo tbody se usa para agrupar el contenido del cuerpo en una tabla HTML.
     * https://www.w3schools.com/tags/tag_tbody.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function tbody($id,$class,$vectorhtml){
        
        print('<tbody id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctbody para cerra el contenido del cuerpo de tabla </tbody>
     */
    function Ctbody(){
        
        print('</tbody>');
    
    }
    
    /**
     * Metodo tfoot se usa para agrupar el contenido del pie de página en una tabla HTML.
     * https://www.w3schools.com/tags/tag_tfoot.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function tfoot($id,$class,$vectorhtml){
        
        print('<tfoot id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Ctfoot para cerra el contenido del pie tabla </tfoot>
     */
    function Ctfoot(){
        
        print('</tfoot>');
    
    }
    
     /**
     * Metodo img define una imagen en una página HTML.
     * https://www.w3schools.com/tags/tag_img.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $src ->atr. src del elemento img
     * @param type $alt ->atr. alt del elemento img  
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function img($id,$class,$src,$alt,$vectorhtml){
        
        print('<img id="'.$id.'" class="'.$class.'" src="'.$src.'" alt="'.$alt.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
    /**
     * Metodo ul define una lista desordenada (con viñetas).
     * https://www.w3schools.com/tags/tag_ul.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function ul($id,$class,$vectorhtml){
        
        print('<ul id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cul para cerra la lista desordenada </ul>
     */
    function Cul(){
        
        print('</ul>');
    
    }
    
     /**
     * Metodo ol define una lista ordenada. Una lista ordenada puede ser numérica o alfabética
     * https://www.w3schools.com/tags/tag_ol.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function ol($id,$class,$vectorhtml){
        
        print('<ol id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Col para cerra la lista ordenada </ol>
     */
    function Col(){
        
        print('</ol>');
    
    }
    
    /**
     * Metodo li define un elemento de la lista
     * https://www.w3schools.com/tags/tag_li.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function li($id,$class,$vectorhtml){
        
        print('<li id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cli para cerra la lista </li>
     */
    function Cli(){
        
        print('</li>');
    
    }
    
     /**
     * Metodo details especifica detalles adicionales que el usuario puede ver u ocultar a pedido.
     * https://www.w3schools.com/tags/tag_details.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function details($id,$class,$vectorhtml){
        
        print('<details id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Cdetails cerra la detalles adicionales </details>
     */
    function Cdetails(){
        
        print('</details>');
    
    }
    
    /**
     * Metodo summary define un encabezado visible para el elemento <details> . Se puede hacer clic en el encabezado para ver / ocultar los detalles.
     * https://www.w3schools.com/tags/tag_summary.asp
     * @param type $id ->atr global. id 
     * @param type $class ->atr global. class
     * @param type $vectorhtml ->vector por si se desea meter mas atributos al elemento(se debe definir antes de ulitlizarlo y en la clase definir el uso para tal atributo)
     */
    function summary($id,$class,$vectorhtml){
        
        print('<summary id="'.$id.'" class="'.$class.'" vectorhtml="'.$vectorhtml.'" >');
    }
    
     /**
     * Metodo Csummary cerra la detalles adicionales </summary>
     */
    function Csummary(){
        
        print('</summary>');
    
    }
        
}
