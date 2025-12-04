{
module Parser where 

import Lexer 
}

%name parser 
%tokentype { Token }
%error { parseError }

%left '+' '-'
%left '*'

%token 
    num             { TokenNum $$ }
    true            { TokenTrue }
    false           { TokenFalse }
    '+'             { TokenPlus }
    '*'             { TokenTimes }
    "&&"            { TokenAnd }
    "||"            { TokenOr }
    '['             { TokenLBrack }
    ']'             { TokenRBrack }
    ','             { TokenComma }
    '('             { TokenLParen }
    ')'             { TokenRParen }
    "if"            { TokenIf }
    "->"            { TokenArrow }
    variable        { TokenVar $$ }
    "Num"           { TokenTNum }
    "Bool"          { TokenTBool }
    ':'             { TokenColon }

%% 

Exp     : num                                   { Num $1 }
        | true                                  { BTrue }
        | false                                 { BFalse }
        | Exp '+' Exp                           { Add $1 $3 }
        | Exp '*' Exp                           { Times $1 $3 }
        | Exp "&&" Exp                          { And $1 $3 }
        | Exp "||" Exp                          { Or $1 $3 }
        | '(' Exp ')'                           { Paren $2 }
        | '[' ']'                               { List [] }
        | '[' ListExps ']'                      { List $2 }
        | "if" Exp '(' Exp ')' '(' Exp ')'      { If $2 $4 $7 }
        | Exp Exp                               { App $1 $2 }
        | variable                              { Var $1 }
        | '(' variable ':' Type ')' "->" Exp    { Lam $2 $4 $7 }

ListExps : Exp                    { [$1] }
         | ListExps ',' Exp       { $1 ++ [$3] }

Type : "Num"                     { TNum }
     | "Bool"                    { TBool }
     | Type "->" Type            { TFun $1 $3 }
     | '[' Type ']'              { TList $2 }

{ 

parseError :: [Token] -> a 
parseError _ = error "Syntax error!"

}