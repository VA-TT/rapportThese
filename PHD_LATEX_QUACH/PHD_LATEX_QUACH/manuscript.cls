\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manuscript}[2025/10/28 v0.9 Colored links and TOC spacing]

% ----------------------------------------------------------------------
% CLASS OPTIONS
% ----------------------------------------------------------------------
\newif\if@english
\newif\if@french
\newif\if@twocolumns
\newif\if@sansserif
\newif\if@coverfooter
\newif\if@colorlinks

\DeclareOption{english}{\@englishtrue \@frenchfalse}
\DeclareOption{french}{\@frenchtrue \@englishfalse}
\DeclareOption{onecolumn}{\@twocolumnsfalse}
\DeclareOption{twocolumn}{\@twocolumnstrue}
\DeclareOption{sansserif}{\@sansseriftrue}
\DeclareOption{coverfooter}{\@coverfootertrue}
\DeclareOption{colorlinks}{\@colorlinkstrue}

\ExecuteOptions{english,onecolumn}
\ProcessOptions\relax

% ----------------------------------------------------------------------
% BASE CLASS
% ----------------------------------------------------------------------
\if@twocolumns
  \LoadClass[11pt,a4paper,twocolumn]{book}
\else
  \LoadClass[11pt,a4paper]{book}
\fi

% ----------------------------------------------------------------------
% PACKAGES
% ----------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{amsmath, amssymb}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{natbib}

% Language support
\if@french
  \RequirePackage[french]{babel}
\else
  \RequirePackage[english]{babel}
\fi

% Optional sans-serif
\if@sansserif
  \renewcommand{\familydefault}{\sfdefault}
\fi

% ----------------------------------------------------------------------
% PAGE LAYOUT
% ----------------------------------------------------------------------
\geometry{margin=1in}
%\setstretch{1.5}
\setlength{\parskip}{0.8em}
\setlength{\parindent}{0pt}
\if@twocolumns
  \setlength{\columnsep}{0.8cm}
\fi

% ----------------------------------------------------------------------
% HEADER & FOOTER
% ----------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[LO]{\nouppercase{\rightmark}}
\fancyhead[RE]{\nouppercase{\leftmark}}
\if@coverfooter
  \newcommand{\coverfootertext}{\centering\small Student Manuscript -- Confidential}
\else
  \newcommand{\coverfootertext}{}
\fi

% ----------------------------------------------------------------------
% WATERMARK
% ----------------------------------------------------------------------
\if@french
  \def\@watermarktext{PROVISOIRE}
\else
  \def\@watermarktext{DRAFT}
\fi

\newcommand{\addprovisoirewatermark}{%
  \AddToShipoutPictureBG*{%
    \begin{tikzpicture}[remember picture,overlay]
      \node[rotate=45,scale=10,text opacity=0.05]
        at (current page.center) {\@watermarktext};
    \end{tikzpicture}%
  }%
}

% ----------------------------------------------------------------------
% TITLE PAGE
% ----------------------------------------------------------------------
\newcommand{\maketitlepage}[4]{%
  \begin{titlepage}
    \addprovisoirewatermark
    \centering
    \vspace*{2cm}
    {\Huge\bfseries #1\par}
    \vspace{1cm}
    {\Large #2\par}
    \vfill
    {\large #3\par}
    \vspace{0.5cm}
    {\large #4\par}
    \vspace{2cm}
    \today
    \vfill
    \coverfootertext
  \end{titlepage}
}

% ----------------------------------------------------------------------
% ABSTRACT (single column, normal text)
% ----------------------------------------------------------------------
\if@french
  \newenvironment{abstractpage}
    {\clearpage\onecolumn%
     \begin{center}\bfseries Résumé\end{center}}
    {\par\vspace{1em}\clearpage%
     \if@twocolumns\twocolumn\fi}
\else
  \newenvironment{abstractpage}
    {\clearpage\onecolumn%
     \begin{center}\bfseries Abstract\end{center}}
    {\par\vspace{1em}\clearpage%
     \if@twocolumns\twocolumn\fi}
\fi

% ----------------------------------------------------------------------
% LOCALIZED CHAPTER NAMES
% ----------------------------------------------------------------------
\if@french
  \addto\captionsfrench{\renewcommand{\chaptername}{Chapitre}}
\else
  \addto\captionsenglish{\renewcommand{\chaptername}{Chapter}}
\fi

% ----------------------------------------------------------------------
% TABLE OF CONTENTS
% ----------------------------------------------------------------------
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \clearpage
  \onecolumn
  {\setlength{\parskip}{0pt} % compact spacing
   \setlength{\itemsep}{0pt}%
   \setcounter{tocdepth}{2}  % show up to sections
   \oldtableofcontents
  }
  \clearpage
  \if@twocolumns\twocolumn\fi
}

% ----------------------------------------------------------------------
% HYPERREF SETTINGS
% ----------------------------------------------------------------------
\RequirePackage{hyperref}
\if@colorlinks
    \hypersetup{
        colorlinks=true,
        linkcolor=blue,
        citecolor=blue,
        urlcolor=blue,
        pdfborder={0 0 0}
    }
\else
    \hypersetup{
        colorlinks=true,
        linkcolor=black,
        citecolor=black,
        urlcolor=black,
        pdfborder={0 0 0}
    }
\fi

% PDF metadata
\hypersetup{
    pdftitle={\if@french Exemple de manuscrit scientifique\else Example Scientific Manuscript\fi},
    pdfauthor={\if@french Jean Dupont\else John Doe\fi},
    pdfsubject={\if@french Manuscrit étudiant\else Student Manuscript\fi},
    pdfkeywords={\if@french science, recherche\else science, research\fi},
    pdfcreator={LaTeX with manuscript.cls},
    pdfproducer={LaTeX}
}

% ----------------------------------------------------------------------
% BIBLIOGRAPHY HANDLER
% ----------------------------------------------------------------------
\newcommand{\bibliographyfile}[1]{%
  \clearpage
  \bibliographystyle{plainnat}
  \bibliography{#1}
}
