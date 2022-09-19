\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{Theme}

\LoadClass[a4paper]{article}

\RequirePackage[top = 2.5cm, bottom = 2.5cm, left = 2cm, right = 2cm,]{geometry} 
\RequirePackage{amsmath, bm} % For the usage of \because and \therefore
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{mathtools}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{authblk}
\RequirePackage{dsfont}
\RequirePackage[calcwidth]{titlesec}
\RequirePackage{bookmark}
\RequirePackage[capitalize]{cleveref}
\RequirePackage{array}
\RequirePackage[english]{babel}
\RequirePackage{enumitem} 
\RequirePackage{natbib}
\bibliographystyle{econ}
\RequirePackage[T1]{fontenc}
%\usepackage{newpxtext,newpxmath}
\RequirePackage{pxfonts}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
% Macros for setting basic info
\gdef\@uni{National Taiwan University}
\gdef\@department{Information Management}
\gdef\@me{Yu-Chieh Kuo}

\newcommand{\course}[2][]{
    \ifstrempty{#1}{
        \gdef\shortcourse{#2}
    }{
        \gdef\shortcourse{#1}
    }
    \gdef\@course{#2}
}
\newcommand{\teacher}[1]{\gdef\@teacher{#1}}
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\newcommand{\uni}[1]{\gdef\@uni{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\student}[3][]{
    \ifstrempty{#1}{
        \author{\textbf{#2} \textbf{#3}}
    }{
        \author[#1]{\textbf{#2} \textbf{#3}}
    }
}
\newcommand{\assignment}[2][Assignment]{
    \ifstrempty{#2}{
        \gdef\@assignment{#1}
    }{
        \gdef\@assignment{#1 #2}
    }
}

% page style for title page
\fancypagestyle{title}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\footnotesize Page {\thepage} of \pageref*{LastPage}} 
}
\newcommand{\ujtitle}{
    \thispagestyle{title}
    \noindent\begin{tabularx}{\linewidth}{Xr} % This is a simple tabular environment to align your text nicely 
    {\large \bf{\@course}} \\
    National Taiwan University, \@semester  \\
    \bottomrule % \hline produces horizontal lines.
    \end{tabularx}
    
    \vspace*{0.3cm}

    \begin{center}
        {\huge\bf\textsc{\@assignment}}\\[3mm]
        {\@author}
    \end{center}

    \vspace*{0.3cm}
}
\newcommand{\mymaketitle}{
    \thispagestyle{title}
    \vspace*{-15mm}
    \noindent\begin{tabularx}{\linewidth}{Xr}
                                & \textsl{National Taiwan University} \\
        \large\textbf{\@semester,} & \textsl{Department of \@department}         \\
        \large\textbf{\@course} & \textsl{Prof. \@teacher}\Bstrut\\
        \bottomrule
    \end{tabularx}

    \vspace*{10mm}

    \begin{center}
        {\huge\textsc{\@assignment{}}}\\[6mm]
        {\@author}
    \end{center}

    \vspace*{1cm}
}

% page style for contents
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{13.6pt}
\lhead{\small {\@course}: {\@assignment}}
\rhead{\small {\@me}}
\cfoot{\small {Page {\thepage} of \pageref*{LastPage}}} 
% Problem and subproblem
% Problem and subproblem
\setcounter{secnumdepth}{0}
\newcounter{problem}
\newcounter{subproblem}[problem]
\newbool{appendix}
\gdef\problemName{Problem}
\newcommand{\problem}[2][]{
    \setcounter{equation}{0}
    \ifstrempty{#1}{
        \stepcounter{problem}
    }{
        \setcounter{problem}{#1}
    }
    \ifstrempty{#2}{
        \ifbool{appendix}{
            \section{\hspace{-5mm}\problemName{} \Alph{problem}.}
        }{
            \section{\hspace{-5mm}\problemName{} \arabic{problem}}
        }
    }{
        \ifbool{appendix}{
            \section{\hspace{-5mm}\problemName{} \Alpa{problem}: #2}
        }{
            \section{\hspace{-5mm}\problemName{} \arabic{problem}: #2}
        }
    }
}
\newcommand{\subproblem}[2][]{
    \setcounter{equation}{0}
    \ifstrempty{#1}{
        \stepcounter{subproblem}
    }{
        \setcounter{subproblem}{#1}
    }
    \ifstrempty{#2}{
        \ifbool{appendix}{
            \section{\hspace{-2mm}\Alph{problem}.\arabic{subproblem}}
        }{
            \section{\hspace{-2mm}\arabic{problem}.(\alph{subproblem})}
        }
    }{
        \ifbool{appendix}{
            \section{\hspace{-2mm}\Alph{problem}.\arabic{subproblem}. #2}
        }{
            \section{\hspace{-2mm}\arabic{problem}.(\alph{subproblem}) #2}
        }
    }
}
% Bookmarks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
        citecolor=myblue,
        linkcolor=myblue,
        urlcolor=myred
}

% Reference nome for task and subtask
\crefname{section}{\sectionname}{\sectionnamepl}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \everymath{\displaystyle} % display all math symbol as DISPLAY MODE

% commands for spacing
\newcommand{\Tstrut}{\rule{0pt}{4mm}}         % = `top' strut
\newcommand{\Bstrut}{\rule[-2mm]{0mm}{0mm}}   % = `bottom' strut

% Paired Delimiters {}, (), []
\providecommand\given{} % so it exists
\newcommand\SetSymbol[1][]{
   \nonscript\,#1\vert \allowbreak \nonscript\,\mathopen{}}
\DeclarePairedDelimiterX\Set[1]{\lbrace}{\rbrace}%
 { \renewcommand\given{\SetSymbol[\delimsize]} #1 }
\DeclarePairedDelimiterX{\Bkt}[1]{[}{]}{#1}
\DeclarePairedDelimiterX{\Paren}[1]{(}{)}{#1}
\DeclarePairedDelimiterX{\Abs}[1]{\lvert}{\rvert}{#1}
\newcommand{\PR}[1]{\Pr\Bkt*{#1}}
\newcommand{\overbar}[1]{\mkern 1.5mu\overline{\mkern-1.5mu#1\mkern-1.5mu}\mkern 1.5mu}

\newcolumntype{D}{>{$(}l<{)$}}
\newcolumntype{R}{>{\displaystyle}r}
\newcolumntype{C}{>{\displaystyle}c}
\newcolumntype{L}{>{\displaystyle}l}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsfonts}
%\RequirePackage{amsthm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declare operator and useful math command
\DeclareMathOperator{\EOp}{\mathbb{E}}
\newcommand{\E}[1]{\ensuremath{\EOp\Bkt*{#1}}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\PS}[1]{\mathcal{P}(#1)}
\newcommand{\ve}{\varepsilon}
\newcommand{\es}{\emptyset}
\newcommand{\sst}{\subset}
\newcommand{\sse}{\subseteq}
\newcommand{\spt}{\supset}
\newcommand{\spe}{\supseteq}
\newcommand{\ie}{\text{ i.e., }}
\newcommand{\st}{\text{ s.t.  }}
%\newcommand{\and}{\text{and}}
% Declare delimiter
\DeclareMathDelimiter{\lVert}
  {\mathopen}{symbols}{"6B}{largesymbols}{"0D}
\DeclareMathDelimiter{\rVert}
  {\mathclose}{symbols}{"6B}{largesymbols}{"0D}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
%\DeclarePairedDelimiter\vector{\langle}{\rangle}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\theoremstyle{plain}
\newtheorem{corollary}{Corollary}
\newtheorem{proposition}{Proposition}
\newtheorem{claim}{Proposition}
\crefname{claim}{Proposition}{Proposition}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{minted}
\setminted[python]{frame=single, linenos, numbersep=4pt, style=tango, breaklines=true, fontsize=\small, tabsize=2}
\setmintedinline[python]{fontsize=\normalsize}
\renewcommand{\theFancyVerbLine}{\sffamily\textcolor[rgb]{0.7,0.7,0.7}{\scriptsize\arabic{FancyVerbLine}}}
\setminted[stata]{frame=single, linenos, numbersep=4pt, style=tango, breaklines=true, fontsize=\small, tabsize=2}
\setmintedinline[stata]{fontsize=\normalsize}
\renewcommand{\theFancyVerbLine}{\sffamily\textcolor[rgb]{0.7,0.7,0.7}{\scriptsize\arabic{FancyVerbLine}}}
% Boxing examples
\def\posskip{\vskip2pt plus 2pt minus 2pt}
\def\negskip{\vskip-8pt plus 2pt minus 2pt}
\newcommand{\fox}[1]{\noindent\framebox{\begin{minipage}{0.984\textwidth}#1\end{minipage}}\ignorespaces}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setCJKmainfont{思源宋體 TW}
%\setmainfont{思源宋體 TW}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use listing package to display different programming language
% Use xcolor package to display syntax color for programming language
% Usage: \env{lstlisting}[language=LANGUAGENAME]
% Common language name: Python, bash, C, C++, R, sh, make, Matlab
\RequirePackage{listings}
\RequirePackage{xcolor}
\definecolor{myred}{RGB}{192,46,46}
\definecolor{myblue}{RGB}{7,75,164}
\definecolor{mygreen}{rgb}{0.11,0.7,0.02}

\lstset{frame=tb,
  language=Python,
      aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
  columns=flexible,
      basicstyle={\small\ttfamily},
    numbers=none,
    numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
      commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
    breaklines=true,
  breakatwhitespace=true,
      tabsize=3
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\course{Writing for Academic Success}
\semester{Fall 2022}
\student[$\dagger$]{Yu-Chieh Kuo}{B07611039}
\affil[$\dagger$]{Department of Information Management, National Taiwan University}

