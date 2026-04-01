# LaTeX Cheatsheet for NTU Dissertation Template

Quick reference for common operations in this template.

## Project Structure

```
latex/
├── main.tex                          # Main entry - DO NOT restructure
├── assets/
│   ├── figures/                      # All figures go here
│   ├── ntu-logo.png
│   └── ntu-watermark.png
├── c-front-matter/                   # Front matter (title, abstract, etc.)
├── chapter-1/ ... chapter-6/         # One directory per chapter
├── c-back-matter/                    # References, appendices
│   ├── references.bib                # BibTeX database
│   ├── appendix-a.tex
│   └── appendix-b.tex
└── .latexmkrc                        # Build configuration
```

## Chapter Template

Every chapter file MUST use this wrapper for correct formatting:

```latex
\chapter{Title Here}
\begingroup
\justifying
\setlength{\parindent}{0pt}
\setstretch{2}
\setlength{\parskip}{0.5\baselineskip}
\titlespacing{\chapter}{0pt}{0pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Your content here
\section{First Section}
...

\endgroup
```

## Figures

```latex
\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/figures/filename.png}
    \caption{Caption text}
    \label{fig:label}
\end{figure}
```

Reference: `As shown in \ref{fig:label}, ...`

Supported formats: `.png`, `.jpg`, `.pdf`

## Tables

```latex
\begin{table}[h]
    \centering
    \caption{Caption text}
    \label{tab:label}
    \begin{tabular}{lcc}
        \toprule
        Col 1 & Col 2 & Col 3 \\
        \midrule
        A & B & C \\
        D & E & F \\
        \bottomrule
    \end{tabular}
\end{table}
```

Use `\toprule`, `\midrule`, `\bottomrule` from `booktabs` (no vertical lines).

## Equations

Inline: `$E = mc^2$`

Display (auto-numbered as Chapter.Number):

```latex
\begin{equation}
    y = \sum_{i=1}^{n} w_i x_i + b
    \label{eq:linear}
\end{equation}
```

Reference: `Equation \ref{eq:linear}`

Multiline:

```latex
\begin{align}
    f(x) &= ax^2 + bx + c \label{eq:quad} \\
    g(x) &= \frac{df}{dx} = 2ax + b \label{eq:deriv}
\end{align}
```

## Citations

Single: `\cite{jordan2002}`

Multiple: `\cite{jordan2002,padgett1995}`

BibTeX entry types:

```bibtex
% Journal article
@article{key,
  author  = {Last, First and Last2, First2},
  title   = {Title},
  journal = {Journal Name},
  volume  = {1},
  number  = {2},
  pages   = {10-20},
  year    = {2024}
}

% Conference paper
@inproceedings{key,
  author    = {Last, First},
  title     = {Title},
  booktitle = {Proc. Conference Name},
  pages     = {1-5},
  year      = {2024}
}

% Book
@book{key,
  author    = {Last, First},
  title     = {Book Title},
  publisher = {Publisher},
  year      = {2024}
}
```

## Cross-References

```latex
\label{type:name}     % Place label (type = fig, tab, eq, sec, ch)
\ref{type:name}       % Reference number
```

Convention for label prefixes:
- `fig:` for figures
- `tab:` for tables
- `eq:` for equations
- `sec:` for sections
- `ch:` for chapters

## Lists

```latex
% Bulleted
\begin{itemize}
    \item First point
    \item Second point
\end{itemize}

% Numbered
\begin{enumerate}
    \item First step
    \item Second step
\end{enumerate}
```

## Acronyms

Define in `c-front-matter/acronyms.tex`. Use full form on first occurrence in text, then abbreviation:

```latex
% First use:
Convolutional Neural Network (CNN) is widely used...
% Subsequent uses:
CNN achieves state-of-the-art performance...
```

## Common Compilation Errors

| Error | Cause | Fix |
|-------|-------|-----|
| `Undefined control sequence` | Typo or missing package | Check command spelling |
| `Missing $ inserted` | Math symbol outside math mode | Wrap with `$...$` |
| `File not found` | Wrong image path | Check path relative to `main.tex` |
| `Citation undefined` | Missing BibTeX entry or no bibtex run | Add to `.bib` and recompile |
| `Overfull \hbox` | Text exceeds margins | Rephrase or use `\sloppy` locally |

## Build Commands

All commands run from the **project root**.

**macOS / Linux:**

```bash
make              # Build PDF once
make watch        # Auto-rebuild on file changes
make clean        # Remove build artifacts
make open         # Open the generated PDF
```

**Windows (PowerShell):**

```powershell
cd latex; latexmk main.tex; cd ..                     # Build once
cd latex; latexmk -pvc main.tex                        # Watch mode
cd latex; latexmk -C; Remove-Item -Recurse out; cd ..  # Clean
Start-Process latex\out\main.pdf                        # Open PDF
```

**Cursor / VS Code (all platforms):**
Save any `.tex` file to auto-build. No commands needed.
