
    function add(){
    
	
      let tAd=document.createElement("td");
      let tSoyad=document.createElement("td");
      let tTC=document.createElement("td");
      let tSil = document.createElement("td"); 
      let silBtn =document.createElement("button");
	  
      silBtn.textContent="Tablodan Sil";
      tSil.appendChild(silBtn); 
	 
	  
      tAd.textContent=ad.value;
      tSoyad.textContent=soyad.value;
      tTC.textContent=tc.value;
 
  
      let tr=document.createElement("tr");
       
	  tr.appendChild(tTC);
      tr.appendChild(tAd);
      tr.appendChild(tSoyad);   
      tr.appendChild(tSil);
     
      liste.appendChild(tr);
 
      ad.value="";
      soyad.value="";
      tc.value="";
 
      ad.focus();
	  
	silBtn.onclick=function()
	{
       liste.removeChild(this.parentNode.parentNode);
	}
	  
    }
 
