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
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="" class="navbar-brand">Language translation App </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/" class="nav-link">Home</a></li>
                         <li><a href="<%=request.getContextPath()%>/NewTranslation" class="nav-link">NewTranslation</a></li>
                    </ul>
                </nav>
            </header>
                     <br>
                      <div class="container col-md-12">
                       <h4>Create your translation on this page</h4>
                     <br>
                       <form action="" method="post" class="ml-2">
                        <fieldset class="form-group">
                              <label>Enter variable: </label>
                                <input name="new_variable" id="new_variable" required/>
                                
                            </fieldset>
                            
                             <fieldset class="form-group">
                                <label>Select language: </label>
                                <select name="language" id="languages" onchange="EmptyValue()" required>
                                <option name="default"> </option>
                                </select>  
                            </fieldset>
                                  <fieldset class="form-group">
                              <label>Enter translation in selected language:</label>
                               </fieldset>
                                 <fieldset class="form-group"><input name="new_translation" id="new_translation" class="offset-1" onblur="UpdateObject()" required/>  </fieldset>
                            
                                
                           
                        <button type="submit" class="btn btn-success offset-1" onClick="HandleRequest()">Translate</button>
                        </form>
                      </div>
                                    <script type="text/javascript">
                                    
                                    var my_Host_link="https://ishyiga-transilation.herokuapp.com/demo/v1/translate/";
                                   var local_link="http://localhost:8081/demo/v1/translate/";
                                    var Allvariables=[];
                     const languages = {
                   		    language1 : 'Kinyarwanda',
                   		    language2 : 'English',
                   		    language3 : 'French',
                   		    language4 : 'Swahili'
                   		};
   
                    		var select_language = document.getElementById("languages");
                    		var selected_language="";
                    		for(index in languages) {
                    			select_language.options[select_language.options.length] = new Option(languages[index], languages[index]);
                    		
                    		}
                    		let Variable="";
                    		let translation="";
                    	
                    		var Translations={
                    				variable:"",
                    				kinyarwanda:"",
                    				english:"",
                    				french:"",
                    				swahili:""
                    		};
                    		function UpdateObject(){
                    			Variable=document.getElementById("new_variable").value;
                    			selected_language=select_language.options[select_language.selectedIndex].value;
                    			selected_language=selected_language.toLowerCase();
                    			translation=document.getElementById("new_translation").value;
                    			Translations.variable=Variable;
                    			Translations[selected_language]=translation;
                    			console.log(selected_language+" "+Translations[selected_language]);
                    			console.log(Translations);
                    		
                    		}
                    		function EmptyValue(){
                    			
                    			console.log("My value: "+document.getElementById("new_translation").value);
                    			document.getElementById("new_translation").value="";
                    		}
                    		function HandleRequest(){
                    			
                    		console.log("Variables now "+Allvariables);
                    	
                    		  	for(let i=0;i<Allvariables.length;i++) {
                    		  		console.log("Variable "+Allvariables[i]);
                        			if(Variable==Allvariables[i]){
                        			     console.log("Updating");
                        			     let text = "You are about to update variable "+Variable+" \n Press OK to confirm or Cancel.";
                        			     if (confirm(text) == true) {
                        						UpdateTranslation(Variable);
                        			     } else {
                        			    	 window.location.reload(true);
                        			    	
                        			     }
                        	
                        				return;
                        			}
                        			
                        		}
                    		  	SubmitTranslation();
                    		  	
                      		
                    		}
                    		function UpdateTranslation(variable){
                    			var url=my_Host_link;
                    			axios({
                    			    method: 'put',
                    			    url:url,
                    			    data:Translations
                    			}).then(response => {
                 				   
                				    console.log(response.data);
                				    window.location.reload(true);
                				   // alert(response.data);
                				});
                    		}
                    		function SubmitTranslation(){
                    			//document.write(Translations);
                    			var url=my_Host_link;
                    			axios.post(url,Translations).then(response => {
                    				var data=response.data;
                    				   //alert(data);
                    				    console.log(response.data);
                    				    window.location.reload(true);
                    				});
                    		

                    		}
                    		 function   FetchVariable(){
                   			  
                              	  axios.get(my_Host_link+"variables").then(
                                 	        (response) => {
                                 	        	var data = response.data;
                                 	        	console.log(data);
                                 	        	Allvariables=data; 
                                 	          console.log("variables: "+Allvariables);
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
