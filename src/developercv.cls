%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developer CV
% LaTeX Class
% Version 1.0 (28/1/19)
%
% This class originates from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv}[2019/01/28 Developer CV class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.} % Dummy text

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=1.75cm, % Top margin
	bottom=1.75cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage[default]{gillius}
%\usepackage{roboto}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%------------------------------------------------

\usepackage{fontawesome} % Required for FontAwesome icons

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
	\vcenteredhbox{\colorbox{black}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{\textcolor{black}{#3}}% Text
}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%----------------------------------------------------------------------------------------
%	CHARTS
%---------------------------------------------------------------------------------------- 

% Command to add a bar to the bar chart
\newcommand{\baritem}[4]{ % The first argument is the bar label, the second is the text to display, the third is the color, and the fourth is the x position
	\node [anchor=north] [label=180:\colorbox{#3}{\textcolor{white}{#1}}] at (0,-#4-0.15) {}; % Creates the bar with its label
	\node [anchor=north] [label=0:{\parbox[t]{\textwidth}{\textcolor{black}{#2}}}] at (0.2,-#4-0.15) {}; % Creates the text next to the bar, adjusted for right justification and allowing for text wrapping
}


%--------------------------------------------------------------------------------------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}
	
	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}
		}
	\end{tikzpicture}
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=black, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{black}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{\baselineskip} % Whitespace before the section title
	\colorbox{black}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\newenvironment{entrylist}{%
  \begin{list}{}{%
    \setlength{\leftmargin}{0pt}
    \setlength{\rightmargin}{0pt}
    \setlength{\itemindent}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\itemsep}{1.25\baselineskip}
  }
}{%
  \end{list}
}

\newcommand{\entry}[4]{%
  \item[]
    \begin{minipage}[t]{0.175\textwidth}% 17.5% of the text width of the page
      #1% Leftmost entry date(s) text
    \end{minipage}%
    \begin{minipage}[t]{0.825\textwidth}% 82.5% of the text width of the page
      \textbf{#2}% Entry heading text
      \hfill% Horizontal whitespace
      {\textcolor{black}{#3}}\\% Right-aligned entry qualifier text
      #4% Entry description text
    \end{minipage}%
}

% ATS-Friendly Entry Command
% Usage: \atsentry{Dates}{Title}{Company/Institution}{Location}{Description}
\newcommand{\atsentry}[5]{%
  \item[] % Start the list item
    % Line 1: Title (Bold)
    \textbf{#2} \\ 
    % Line 2: Company/Institution (Bold) --- Location 
    \textbf{#3} \hfill {#4} \\ 
    % Line 3: Dates
    {#1} \\ 
    % Line 4: Description (Should contain an itemize environment)
    % Add some vertical space before the description if needed, adjust as necessary
    \vspace{0.25\baselineskip} 
    #5 
}


% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

\usepackage[x11names]{xcolor}