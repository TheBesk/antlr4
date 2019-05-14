grammar tinyrexx;

program   : statement+;
          
statement : assign | print | input | w_loop | i_t_e | b_op | f_loop | terminate ;

assign    : ID '=' a_expr ;
i_assign  : ID '=' a_expr ;
print     : 'say' a_expr ;
input     : 'pull' ID ;
w_loop    : 'do' 'while' test statement+ 'end' ;
f_loop    : 'do' i_assign 'to' f_test statement+ 'end';
i_t_e     : 'if' guardia 'then' 'do' statement+ 'end'|'if' guardia 'then' 'do' statement+ 'end' i_e;
i_e	  : 'else' 'do' statement+ 'end';
test      : a_expr r_op a_expr;
a_expr    : ID | NUMBER | '(' a_expr ')' | a_expr a_op a_expr | MINUS a_expr ;
a_op      : MINUS | PLUS | MUL | DIV ;
r_op      : EQUAL | LT | LEQ | GT | GEQ ;
b_op      : b_op AND b_op | b_op OR b_op | NOT b_op | test;
guardia   : test | a_expr;
terminate : 'exit' a_expr;
f_test    : a_expr;



MINUS     : '-' ;
PLUS      : '+' ;
MUL       : '*' ;
DIV       : '/' ;
EQUAL     : '==' ;
LT        : '<' ;
LEQ       : '<=' ;
GT        : '>' ;
GEQ       : '>=' ;
ID        : [a-z]+ ;
NUMBER    : [0-9]+ ;
WS        : [ \n\t]+ -> skip;
AND       : [&];
OR        : [|];
NOT       : [!];
ErrorChar : . ;
