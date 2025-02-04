# First and last name
NAME = Nasif_Mauthoor

# Output directory
OUT_DIR = out

# Source files
MAIN_TEX = src/resume.tex

# Ensure output directory exists
$(shell mkdir -p $(OUT_DIR))

# Main target
all: $(OUT_DIR)/resume.pdf

# Compile LaTeX document
$(OUT_DIR)/resume.pdf: FORCE $(MAIN_TEX)
	pdflatex -output-directory=$(OUT_DIR) $(MAIN_TEX)
	pdflatex -output-directory=$(OUT_DIR) $(MAIN_TEX)

# Force target to always run
FORCE:

# Clean up auxiliary files but keep PDF
clean:
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out $(OUT_DIR)/*.toc $(OUT_DIR)/*.lof $(OUT_DIR)/*.lot

# Clean up everything including PDF
distclean: clean
	rm -f $(OUT_DIR)/*.pdf

.PHONY: all clean distclean FORCE
