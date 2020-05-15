/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    Wbook = 258,
    Styles = 259,
    Style = 260,
    Id = 261,
    Styleid = 262,
    Wsheet = 263,
    Name = 264,
    Table = 265,
    Excol = 266,
    Exrow = 267,
    Protected = 268,
    Col = 269,
    Row = 270,
    Cell = 271,
    Height = 272,
    Width = 273,
    Hidden = 274,
    Data = 275,
    Meracross = 276,
    Merdown = 277,
    Type = 278,
    datastring = 279,
    datanumber = 280,
    databoolean = 281,
    datadatetime = 282,
    Num = 283,
    String = 284,
    String2 = 285,
    Boolean = 286,
    Datetime = 287,
    ss = 288,
    st = 289,
    en = 290,
    sl = 291,
    eq = 292,
    cl = 293
  };
#endif
/* Tokens.  */
#define Wbook 258
#define Styles 259
#define Style 260
#define Id 261
#define Styleid 262
#define Wsheet 263
#define Name 264
#define Table 265
#define Excol 266
#define Exrow 267
#define Protected 268
#define Col 269
#define Row 270
#define Cell 271
#define Height 272
#define Width 273
#define Hidden 274
#define Data 275
#define Meracross 276
#define Merdown 277
#define Type 278
#define datastring 279
#define datanumber 280
#define databoolean 281
#define datadatetime 282
#define Num 283
#define String 284
#define String2 285
#define Boolean 286
#define Datetime 287
#define ss 288
#define st 289
#define en 290
#define sl 291
#define eq 292
#define cl 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
