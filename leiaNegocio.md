# fatorr
PADRONIZAÇÃO DE CÓDIGO - camel case
	
	TABELAS:
		tb_nomeTabela
		ad_nomeTabela - Auditoria
	
	ABREVIAÇÕES:
		percNomeCampoAtributo	
		vlrNomeCampo			
		dtNomeCampo  			
		min
		max
		
            LÓGICA DO CÁLCULO DO SIMPLES E FATOR R
  
  GLOSSÁRIO
  
  * TBTRI = Tabela de tributação (Anexo III ou V) em tb_tributacao;
  
  * AN    = Alíquota Nominal da TBTRI da faixa;
  
  * PD    = Parcela a Deduzir da tabela de tributação TBTRI da faixa;
  
  * AE    = Alíquota Efetiva;
  
  * FPT12 = Despesas com folha de salário e demais encargos trabalhistas (incluido sobre pró-labore para os sócios), 
            acumulada 12 meses anteriores ao período de apuração;
            
  * RBT12 = Receita bruta acumulada 12 meses anteriores ao período de apuração;
  
  * RBT   = Receita bruta do período de apuração;
  
  * R     = Fator R razão entre FPT12 / RBT12;
  
  * DAS   = Documento de Arrecadação do Simples Nacional a pagar;
  
  PASSO 1 - ESTABELECER FATOR R
  
  O Fator R é a razão entre a soma dos custos trabalhistas e a receita bruta auferida pela empresa, estabelecido pela seuginte
  fórmula:
         R =  FPT12 / RBT12

  Legislação: Lei Complementar 123/2006
        
        R < 28,00 % - Anexo V
    “Quando a relação entre a folha de salários e a receita bruta da microempresa ou da empresa de pequeno porte for 
     inferior a 28% (vinte e oito por cento), serão tributadas na forma do Anexo V desta Lei Complementar para as 
     atividades previstas.”

        R >= 28,00 % - Anexo III
    “As atividades de prestação de serviços a que se refere o § 5o-I serão tributadas na forma do Anexo III desta Lei 
     Complementar caso a razão entre a folha de salários e a receita bruta da pessoa jurídica seja igual ou superior 
     a 28% (vinte e oito por cento).”
  
  O Fator R é o indexador que seleciona qual tabela de tributação deverá ser aplicada para o cálculo do imposto do Simples Nacional.
  
  PASSO 2 - CALCULAR SIMPLES NACIONAL
  
  Com base na tabela selecionada pelo Fator R estabelecer:
  
      AE    = RBT12 x AN - PD / RBT12
      
      DAS   = RBT x AE;
      
      
