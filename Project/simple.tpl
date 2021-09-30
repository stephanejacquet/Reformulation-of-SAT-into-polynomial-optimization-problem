// Copyright (c) 2008, 2009, 2010 Regents of the University of California.
//
// ADModelbuilder and associated libraries and documentations are
// provided under the general terms of the "BSD" license.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2.  Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3.  Neither the name of the  University of California, Otter Research,
// nor the ADMB Foundation nor the names of its contributors may be used
// to endorse or promote products derived from this software without
// specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


DATA_SECTION
  init_int v_num
  init_int c_num
  init_int l_num
  init_vector l_c_num(1,c_num)
  init_vector l_val(1,l_num)
  !!cout<<v_num<<endl;
  
PARAMETER_SECTION
  //init_bounded_number a(0,1);
  //init_bounded_number b(0,1);
    init_bounded_vector a(1,v_num,0,1);
    //init_vector a(1,v_num);
    number valeur;
    

  objective_function_value f

PROCEDURE_SECTION
 
 //f=1.0; //This initialisation is required for transformation tau
 f=0.0;//This initialisation is required for transformation kappa
 int cumulative=1;
 int indice;
 int i;
 int k;
 for(i=1;i<=c_num;i++)// for each clause
 {
	valeur=0.0;
 	
 
 	for(k=1;k<=l_c_num[i];k++)
 	{
		
        	indice=l_val[cumulative];
		//f*=a[abs(l_val[cumulative])];
 		if(indice>0)
        	{
        
        		valeur=valeur+a[indice]-valeur*a[indice];
        
        	}
        	if(indice<0)
        	{
        		valeur=valeur+1-a[-indice]-valeur*(1-a[-indice]);
      
        	}

        	cumulative++;
 	}
   
   f=f+valeur;// This is the transformation rule characterizing the transformation kappa
   //f=f*valeur*8/7; // This is the transformation rule characterizing the transformation tau
   //f+=log(valeur);
   
 }
 
  //f=-100000000000000*f;
  //f=-pow(8/5,c_num)*f;
  f=-f;
