# Output directory
OUT_DIR = out

# Source files
MAIN_TEX = src/main.tex

# Ensure output directory exists
$(shell mkdir -p $(OUT_DIR))

# Main target
all: $(OUT_DIR)/main.pdf

# Compile LaTeX document
$(OUT_DIR)/main.pdf: $(MAIN_TEX)
	pdflatex -output-directory=$(OUT_DIR) $<
	pdflatex -output-directory=$(OUT_DIR) $<

# Clean up auxiliary files but keep PDF
clean:
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out $(OUT_DIR)/*.toc $(OUT_DIR)/*.lof $(OUT_DIR)/*.lot

# Clean up everything including PDF
distclean: clean
	rm -f $(OUT_DIR)/*.pdf

.PHONY: all clean distclean
