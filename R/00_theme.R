# =============================================================================
# 00_theme.R : thème et palette communs à tous les graphiques
# Palette de référence (validée pour le daltonisme sur les 3 premières couleurs)
# =============================================================================
suppressPackageStartupMessages({ library(ggplot2); library(patchwork); library(scales) })

FOND   <- "#fcfcfb"
ENCRE  <- "#0b0b0b"
ENCRE2 <- "#52514e"
GRILLE <- "#e6e5e0"
NEUTRE <- "#b9b8b2"          # éléments de contexte (non-données)

BLEU   <- "#2a78d6"          # série 1
ORANGE <- "#eb6834"          # série 2
AQUA   <- "#1baf7a"          # série 3
ROUGE  <- "#e34948"

# rampe séquentielle (bleu) et divergente (bleu <-> rouge, milieu gris)
SEQ_BLEU <- c("#cde2fb", "#9ec5f4", "#6da7ec", "#3987e5", "#256abf", "#184f95", "#0d366b")
DIV_MIL  <- "#f0efec"

theme_projet <- function(base = 11) {
  theme_minimal(base_size = base) %+replace%
    theme(
      plot.background  = element_rect(fill = FOND, colour = NA),
      panel.background = element_rect(fill = FOND, colour = NA),
      panel.grid.major = element_line(colour = GRILLE, linewidth = 0.3),
      panel.grid.minor = element_blank(),
      text             = element_text(colour = ENCRE),
      axis.text        = element_text(colour = ENCRE2, size = rel(0.85)),
      axis.title       = element_text(colour = ENCRE2, size = rel(0.9)),
      plot.title       = element_text(face = "bold", size = rel(1.15), hjust = 0,
                                      margin = margin(b = 4)),
      plot.subtitle    = element_text(colour = ENCRE2, hjust = 0, margin = margin(b = 8)),
      plot.caption     = element_text(colour = ENCRE2, size = rel(0.75), hjust = 1),
      strip.text       = element_text(face = "bold", colour = ENCRE, hjust = 0,
                                      margin = margin(4, 0, 4, 0)),
      legend.position  = "top",
      legend.justification = "left",
      legend.title     = element_text(colour = ENCRE2, size = rel(0.85)),
      legend.text      = element_text(colour = ENCRE, size = rel(0.85)),
      plot.margin      = margin(10, 14, 8, 10)
    )
}
theme_set(theme_projet())

sauver <- function(p, fichier, l = 10, h = 5.5) {
  ggsave(fichier, p, width = l, height = h, dpi = 150, bg = FOND)
  cat("  ->", basename(fichier), "\n")
}
SOURCE <- "Source : RTE éCO2mix, Open-Meteo (ERA5), calendrier.api.gouv.fr"
