# First and last name
NAME       = Nasif Mauthoor

# Output directory
OUT_DIR    = out

# Source files
MAIN_TEX   = src/resume.tex
COVER_TEX  = src/cover.tex

# Output file names with date prefix
DATE       = $(shell date +%Y%m%d)

# Get the argument passed to make (if any)
RESUME_TYPE = $(filter-out resume,$(MAKECMDGOALS))

# Define the resume filename based on whether an argument was provided
ifeq ($(RESUME_TYPE),)
    RESUME_PDF = $(OUT_DIR)/$(DATE) $(NAME) Resume.pdf
else
    RESUME_PDF = $(OUT_DIR)/$(DATE) $(NAME) Resume $(RESUME_TYPE).pdf
endif

COVER_PDF  = $(OUT_DIR)/$(DATE) $(NAME) Cover.pdf

# Create output directory if it doesn't exist
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Build resume PDF
resume: $(OUT_DIR)
	pdflatex -output-directory=$(OUT_DIR) $(MAIN_TEX)
	mv $(OUT_DIR)/resume.pdf "$(RESUME_PDF)"
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out

# Build cover letter PDF  
cover: $(OUT_DIR)
	pdflatex -output-directory=$(OUT_DIR) $(COVER_TEX)
	mv $(OUT_DIR)/cover.pdf "$(COVER_PDF)"
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out

# Build both PDFs
all: resume cover

# remove generated PDFs
clean:
	rm -f $(OUT_DIR)/*

# Treat any additional arguments as targets (prevents make from complaining)
%:
	@:
