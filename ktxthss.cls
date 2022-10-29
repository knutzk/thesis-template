\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{ktxthss}
[2022/10/29 v1.0.0 Thesis template class]
\RequirePackage{etoolbox}[2011/01/03]
\RequirePackage{ifthen}[1999/01/07]
\RequirePackage{kvoptions}[2011/06/30]
\RequirePackage{xstring}[2012/10/24]
\SetupKeyvalOptions{%
  family=ktx,
  prefix=ktx@
}
\newcommand*{\ktx@warning}[1]{\ClassWarning{ktx}{#1}}
\newcommand*{\ktx@info}[1]{\ClassInfo{ktx}{#1}}
\newcommand*{\ktx@error}[2]{\ClassError{ktx}{#1}{#2}}
\DeclareBoolOption[false]{draft}
\DeclareComplementaryOption{final}{draft}
\DeclareBoolOption[false]{preliminary}
\DeclareStringOption[default]{headers}
\DeclareBoolOption[true]{pagenumberstop}
\PassOptionsToClass{%
                    fontsize     = 11pt,%
                    twoside      = yes,%
                    DIV          = 12,%
                    titlepage    = firstiscover,%
                    numbers      = autoendperiod,%
                    toc          = bibliography,%
                    }{scrbook}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessKeyvalOptions*
\LoadClass{scrbook}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\newcommand*{\issuepreliminarywarning}{\ktx@warning{%
    Option "preliminary" is set. To get full draft features,\MessageBreak
    set option "draft" (and deactivate "preliminary"). If \MessageBreak
    this is meant to be a final version, deactivate the \MessageBreak
    preliminary and draft option or set the option "final".\MessageBreak}
}
\ifthenelse{\boolean{ktx@preliminary}}{%
  \setboolean{ktx@draft}{true}
}{}
\ifthenelse{\boolean{ktx@draft}}{%
  \RequirePackage[english,scrtime]{prelim2e}%
  \RequirePackage[mathlines]{lineno}%
  \newcommand*\linenomathpatchAMS[1]{%
    \expandafter\pretocmd\csname #1\endcsname {\linenomathAMS}{}{}%
    \expandafter\pretocmd\csname #1*\endcsname{\linenomathAMS}{}{}%
    \expandafter\apptocmd\csname end#1\endcsname {\endlinenomath}{}{}%
    \expandafter\apptocmd\csname end#1*\endcsname{\endlinenomath}{}{}%
  }
  \expandafter\ifx\linenomath\linenomathWithnumbers
    \let\linenomathAMS\linenomathWithnumbers
    \patchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{}{}
  \else
    \let\linenomathAMS\linenomathNonumbers
  \fi
  \AtBeginDocument{%
    \linenomathpatchAMS{gather}
    \linenomathpatchAMS{multline}
    \linenomathpatchAMS{align}
    \linenomathpatchAMS{alignat}
    \linenomathpatchAMS{flalign}
  }
  \linenumbers%
  \ifthenelse{\boolean{ktx@preliminary}}{%
    \issuepreliminarywarning
    \KOMAoptions{draft=false}
  }{%
    \RequirePackage{showframe}%
    \KOMAoptions{draft=true}%
  }
}{%
  \KOMAoptions{draft=false}
}
\RequirePackage{leading}
\leading{15pt}
\setlength{\topmargin}{48.5pt-1in}
\setlength{\textheight}{656pt}
\def\@textbottom{\vskip \z@ \@plus 0.7pt}
\let\@texttop\relax
\setlength{\parskip}{0pt}
\RequirePackage{xcolor}
\definecolor{Venetian}{cmyk}{0, 0.95, 0.85, 0.30}
\definecolor{Lime}{cmyk}{0.85, 0, 0.75, 0.25}
\definecolor{Dodger}{cmyk}{1, 0.40, 0, 0.10}
\RequirePackage[babel   = true,%
                stretch = 10,%
                shrink  = 10,%
                final   = true,%
                tracking = smallcaps,%
                letterspace = 50,%
                ]{microtype}
\newrobustcmd{\ktx@allcaps}[1]{%
  \ktx@warning{Spacing of small caps not adjusted! Using
    default\MessageBreak spacing now.}\textsc{\MakeUppercase{#1}}}
\newrobustcmd{\ktx@lowcaps}[1]{%
  \ktx@warning{Spacing of small caps not adjusted! Using
    default\MessageBreak spacing now.}\textsc{\MakeLowercase{#1}}}
\ifboolexpr{ test {\@ifpackageloaded{letterspace}} or
             test {\@ifpackageloaded{microtype}} }{%
  \ktx@info{Using letterspacing options of microtype package.}
  \renewrobustcmd{\ktx@allcaps}[1]{\textls[50]{\MakeUppercase{#1}}}
  \renewrobustcmd{\ktx@lowcaps}[1]{\textsc{\MakeLowercase{#1}}}
}{%
  \relax
}
\let\textsca\ktx@allcaps
\let\textscl\ktx@lowcaps
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[autostyle=true]{csquotes}
\RequirePackage{graphicx}
\RequirePackage{xspace}
\RequirePackage{enumitem}
\setlist{nosep}
\setlist{leftmargin=1.5em}
\numberwithin{equation}{chapter}
\numberwithin{table}{chapter}
\numberwithin{figure}{chapter}
\newenvironment{abstractpage}[1][1.0]{%
  \begin{samepage}%
  \thispagestyle{plain}%
  \vspace*{1em minus 1em}%
  \begin{center}\begin{minipage}{#1\linewidth}}{%
  \end{minipage}\end{center}%
  \vspace*{0pt minus 2em}%
  \end{samepage}
  \cleardoublepage}
\newenvironment{abstract}[2]{%
  \addsec*{#2}\begin{otherlanguage}{#1}}{%
  \end{otherlanguage}%
  \vspace*{2em}%
}
\addtokomafont{disposition}{\bfseries\sffamily}
\addtokomafont{title}{\color{black}}
\setkomafont{paragraph}{\normalsize\mdseries\rmfamily\scshape}
\KOMAoptions{chapterprefix}%
\newkomafont{chapternumber}{\normalfont\sffamily\Huge}%
\RedeclareSectionCommand[%
  beforeskip=-75pt,%
  innerskip=32pt plus 3pt,%
  afterskip=42pt plus 3pt,%
  font=\normalfont\sffamily\Large,%
  prefixfont=\normalfont\sffamily\Large,%
]{chapter}
\renewcommand*{\chapterformat}{%
  \mbox{\strut\MakeUppercase{\chapappifchapterprefix{\enskip}}%
    {\usekomafont{chapternumber}\strut\thechapter}%
    \IfUsePrefixLine{}{\enskip}}%
}
\renewcommand{\chapterlineswithprefixformat}[3]{%
  {\usekomafont{chapternumber}\raggedleft#2}
  \rule{\textwidth}{0.5mm}\par%
  \vspace*{5pt}%
  \strut\raggedleft#3%
  \vspace*{4pt}%
  \par\rule{\textwidth}{0.5mm}%
}
\RedeclareSectionCommand[beforeskip=-3.5ex plus -1.5ex minus -.2ex]{section}
% \RedeclareSectionCommand[beforeskip=-3.5ex \@plus -1ex \@minus -.2ex{section} % default values
\RedeclareSectionCommand[beforeskip=15pt plus 0.7pt minus 0.7pt]{paragraph}
\RedeclareSectionCommand[afterskip=-0.5em]{paragraph}
\appto{\normalsize}{%
  \setlength{\abovedisplayskip}{11pt plus 3pt minus 6pt}%
  \setlength{\belowdisplayskip}{11pt plus 3pt minus 6pt}%
}
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}
\automark[section]{chapter}
\let\ktx@thepage@l\empty
\let\ktx@thepage@r\empty
\ifthenelse{\boolean{ktx@pagenumberstop}}{%
  \renewcommand*{\ktx@thepage@l}{\llap{\thepage\kern1.5em}}
  \renewcommand*{\ktx@thepage@r}{\rlap{\kern1.5em\thepage}}
  \ofoot[]{}
  \cfoot[]{}
}{}
\lehead[\ktx@thepage@l]{\ktx@thepage@l\headmark}
\rohead[\ktx@thepage@r]{\headmark\ktx@thepage@r}
\chead[]{}
\setkomafont{pagehead}{\normalfont\itshape}
\RequirePackage[format = plain,%
                margin = 2.0em,%
                labelsep = colon,%
                ]{caption}
\renewcommand*{\figureformat}{\figurename~\thefigure}
\renewcommand*{\tableformat}{\tablename~\thetable}
\RequirePackage{setspace}
\AtBeginEnvironment{tabular}{\small}
\captionsetup{font={small,stretch=1.1666}}
\captionsetup[table]{belowskip=0.5\baselineskip}
\RequirePackage[font+=footnotesize]{subcaption}
\RequirePackage{booktabs}
\RequirePackage{textcomp}
\RequirePackage[separate-uncertainty]{siunitx}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\textfraction}{0.07}
\renewcommand{\floatpagefraction}{0.7}
\renewcommand{\coverpagetopmargin}{1in}
\renewcommand{\coverpagebottommargin}{1in}
\renewcommand{\coverpageleftmargin}{1in}
\renewcommand{\coverpagerightmargin}{1in}
\setkomafont{title}{\bfseries\rmfamily}
\setkomafont{subtitle}{\large}
\setkomafont{author}{\large}
\setkomafont{publishers}{\large}
\DeclareTOCStyleEntry[%
    entryformat=\normalfont,%
    pagenumberformat=\normalfont,%
    raggedpagenumber,%
    linefill=\quad,%
    ]{tocline}{section}%
\DeclareTOCStyleEntry[%
    entryformat=\normalfont\large,%
    pagenumberformat=\normalfont\large,%
    raggedpagenumber,%
    linefill=\quad,%
    ]{tocline}{chapter}%
\DeclareTOCStyleEntry[beforeskip=1.0ex]{tocline}{section}
\setcounter{tocdepth}{1}

\endinput
%%
%% End of file `ktxthss.cls'.
