<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   

        <head>
            <title>Language translation Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
           
        </head>
<body onload="FetchVariable()">
 <header>
                <nav class="navbar navbar-expand-md navbar-dark col-9" style="background-color: tomato">
                    <div>
                        <a href="/" class="navbar-brand">Language translation App </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/" class="nav-link">Home</a></li>
                         <li><a href="<%=request.getContextPath()%>/NewTranslation" class="nav-link">NewTranslation</a></li>
                    </ul>
                </nav>
            </header>
                     <br>
                     
                     <div class="container col-lg-12">
                     <h4>Choose the variable and the translational language</h4>
                     <br>
                       <form action="" method="get" class="ml-2">
                        <fieldset class="form-group">
                                <label>choose variable: </label>
                                <select name="variable" id="variables"></select>
                                   
                            </fieldset>
                            
                             <fieldset class="form-group">
                                <label>Select language: </label>
                                <select name="language" id="languages"></select>  
                            </fieldset>
                        <button type="button" class="btn btn-success offset-1" onClick="GetTranslated()">Translate</button>
                        </form>
                        
                    </div>
                  
                     </div>
                     <div class="row m-4"><p id="message"></p></div>
                     <script type="text/javascript">
                     var variables=[];
                   
                 var my_Host_link="https://ishyiga-transilation.herokuapp.com/demo/v1/translate/";
                var local_link="http://localhost:8081/demo/v1/translate/";
                     const languages = {
                   		    language1 : 'Kinyarwanda',
                   		    language2 : 'English',
                   		    language3 : 'French',
                   		    language4 : 'Swahili'
                   		};
                 	var select_variables = document.getElementById("variables");
                 	var selected_variable="";
            	
            		
                    		var select_language = document.getElementById("languages");
                    		var selected_language="";
                    		for(index in languages) {
                    			select_language.options[select_language.options.length] = new Option(languages[index], languages[index]);
                    		
                    		}
                    		var translatedLanguage="";
                    		function GetTranslated(){
                    		
                    			selected_variable=select_variables.options[select_variables.selectedIndex].value;
                    			selected_language=select_language.options[select_language.selectedIndex].value;
                    			makeTranslationGetRequest(my_Host_link);
                    		   
                    		
                    		
                    			//alert("Choosen variable: "+selected_variable+" , Selected language: "+selected_language);
                    			
                    		}
                    		 function makeTranslationGetRequest(path) {
                         	    axios.get(path+selected_variable).then(
                         	        (response) => {
                         	            var data = response.data;
                         	            if (data) {
                         	            	const lang = selected_language.toLowerCase();
                         	            	translatedLanguage=data[lang];
                         	            	console.log(translatedLanguage);
                         	            	 document.getElementById("message").innerHTML="Translated variable "+selected_variable+"  in "+selected_language +" language is: "+translatedLanguage;
                                      		
                         	            } else {
                         	            	console.log('No translations for the selected language added yet.')
                         	            }
                         	        },
                         	        (error) => {
                         	            console.log(error);
                         	        }
                         	    );
                         	
                    		}
                    		 function   FetchVariable(){
                    			  
                           	  axios.get("https://ishyiga-transilation.herokuapp.com/demo/v1/translate/variables").then(
                              	        (response) => {
                              	        	var data = response.data;
                              	        	console.log("variables: "+data);
                              	        	variables=data; 
                              	      	for(let i=0;i<variables.length;i++) {
                                			select_variables.options[select_variables.options.length] = new Option(data[i],data[i]);
                                			
                                		}
                              	          console.log("variables: "+variables);
                              	        },
                              	        (error) => {
                              	            console.log(error);
                              	        }
                              	    );
                             }
                     </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                     </body>
</html>
