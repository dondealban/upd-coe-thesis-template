%--------------------------------------------------------------------------
% This 'UPD-CoE-Thesis-Template.cls' class sets the format of the thesis 
% template. To use it, instantiate \documentclass{UPD-CoE-Thesis-Template}
% in 'UPD-CoE-Thesis-Template.tex' file. The file 'format.tex' file needs 
% to be supplied, which defines the packages needed.
%--------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UPD-CoE-Thesis-Template}[2017/06/30 UPD CoE Thesis Class]

%--------------------------------------------------------------------------
% Font Size
%--------------------------------------------------------------------------
\newcommand\@thesisptsize{12pt}
\DeclareOption{12pt}{\renewcommand\@thesisptsize{12pt}}
\DeclareOption{11pt}{\renewcommand\@thesisptsize{11pt}}
\DeclareOption{10pt}{\renewcommand\@thesisptsize{10pt}}

\ProcessOptions

\LoadClass[\@thesisptsize,letterpaper,oneside]{book}

\pagestyle{plain}

%--------------------------------------------------------------------------
% Page Setup
%--------------------------------------------------------------------------

% Note: Based on National Graduate School of Engineering Thesis Guidelines
\setlength{\voffset}{-1in}  
\setlength{\marginparsep}{0in}  
\setlength{\marginparwidth}{0in}  
\setlength{\marginparpush}{0in} 
\setlength{\parindent}{0.75cm} 
\setlength{\hoffset}{-1in}  
\setlength{\oddsidemargin}{3.8cm}  
\setlength{\evensidemargin}{3.8cm} 
\setlength{\textwidth}{15.25cm}
\setlength{\topmargin}{2.54cm}
\setlength{\textheight}{20.32cm}
%\setlength{\headheight}{15pt}
%\setlength{\headsep}{16pt}
%\setlength{\footskip}{18pt}
\renewcommand{\baselinestretch}{1.7} % Line spacing


% \tableofcontents
\makeatletter
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

% \listoffigures
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

% \listoftables
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }

% thebibliograph
%\renewenvironment{thebibliography}[1]
%     {\chapter*{\bibname
%        \@mkboth{\bibname}{\bibname}}%
%      \list{\@biblabel{\@arabic\c@enumiv}}%
%           {\settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}%
 %     \endlist}

% bibliography
%\RequirePackage{natbib}
\usepackage[style=authoryear,bibencoding=utf8,minnames=1,maxnames=3, maxbibnames=99,natbib=true,dashed=false,terseinits=true,firstinits=true,uniquename=false,uniquelist=true,labeldate=true,doi=true, isbn=true, natbib=true,backend=biber]{biblatex}

\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat[article]{pages}{#1}
\DeclareFieldFormat[inproceedings]{pages}{\lowercase{pp.}#1}
\DeclareFieldFormat[incollection]{pages}{\lowercase{pp.}#1}
\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}
\DeclareFieldFormat[article]{title}{\MakeCapital{#1}}
\DeclareFieldFormat[article]{url}{}
\DeclareFieldFormat[book]{url}{}
\DeclareFieldFormat[inbook]{url}{}
\DeclareFieldFormat[incollection]{url}{}
\DeclareFieldFormat[inproceedings]{url}{}
\DeclareFieldFormat[inproceedings]{title}{#1}
\DeclareFieldFormat{shorthandwidth}{#1}

% No dot before number of articles
\usepackage{xpatch}
\xpatchbibmacro{volume+number+eid}{\setunit*{\adddot}}{}{}{}

% Remove In: for an article.
\renewbibmacro{in:}{%
 	\ifentrytype{article}{}{%
  	\printtext{\bibstring{in}\intitlepunct}}}

% Get rid of months in dates (not sure that this works)
\AtEveryBibitem{\clearfield{month}}
\AtEveryCitekey{\clearfield{month}}

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {{\bibname}}{{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\def\theenumiv{\arabic{enumiv}}}%
	\def\newblock{\hskip .11em plus.33em minus.07em}%
	\sloppy\clubpenalty4000\widowpenalty4000
	\sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}

% Input the format.tex file.
% \input format.tex
% \endinput
