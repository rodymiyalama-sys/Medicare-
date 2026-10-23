import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// =====================================================
/// WIDGET DES STATISTIQUES DU TABLEAU DE BORD
/// Affiche la répartition des patients sous forme
/// de graphique circulaire.
/// =====================================================
class ChartsWidget extends StatelessWidget {
  const ChartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// =====================================
      /// HAUTEUR DU BLOC
      /// =====================================
      height: 400,

      /// Marge intérieure
      padding: const EdgeInsets.all(20),

      /// Style du conteneur
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// =====================================
          /// TITRE DU WIDGET
          /// =====================================
          const Text(
            "Répartition des patients",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          /// =====================================
          /// CONTENU PRINCIPAL
          /// Graphique à gauche
          /// Légende à droite
          /// =====================================
          Expanded(
            child: Row(
              children: [

                /// =====================================
                /// PARTIE GAUCHE : GRAPHIQUE
                /// =====================================
                Expanded(
                  flex: 5,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,

                      child: Stack(
                        alignment: Alignment.center,

                        children: [

                          /// ==========================
                          /// GRAPHIQUE CIRCULAIRE
                          /// ==========================
                          PieChart(
                            PieChartData(
                              sectionsSpace: 0,

                              /// Taille du trou central
                              centerSpaceRadius: 60,

                              sections: [

                                /// HOMMES = 40%
                                PieChartSectionData(
                                  value: 40,
                                  color: Colors.blue,
                                  radius: 28,
                                  showTitle: false,
                                ),

                                /// FEMMES = 30%
                                PieChartSectionData(
                                  value: 30,
                                  color: Colors.green,
                                  radius: 28,
                                  showTitle: false,
                                ),

                                /// ENFANTS = 20%
                                PieChartSectionData(
                                  value: 20,
                                  color: Colors.orange,
                                  radius: 28,
                                  showTitle: false,
                                ),

                                /// AUTRES = 10%
                                PieChartSectionData(
                                  value: 10,
                                  color: Colors.grey,
                                  radius: 28,
                                  showTitle: false,
                                ),
                              ],
                            ),
                          ),

                          /// ==========================
                          /// TEXTE CENTRAL
                          /// ==========================
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [

                              /// Nombre total de patients
                              Text(
                                "128",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4),

                              /// Libellé
                              Text(
                                "Patients",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Espace entre le graphique et la légende
                const SizedBox(width: 16),

                /// =====================================
                /// PARTIE DROITE : LÉGENDE
                /// =====================================
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      _LegendItem(
                        color: Colors.blue,
                        text: "Hommes",
                        value: "40%",
                      ),

                      SizedBox(height: 18),

                      _LegendItem(
                        color: Colors.green,
                        text: "Femmes",
                        value: "30%",
                      ),

                      SizedBox(height: 18),

                      _LegendItem(
                        color: Colors.orange,
                        text: "Enfants",
                        value: "20%",
                      ),

                      SizedBox(height: 18),

                      _LegendItem(
                        color: Colors.grey,
                        text: "Autres",
                        value: "10%",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =====================================================
/// WIDGET DE LA LÉGENDE
/// Affiche :
/// ● Couleur
/// Nom
/// Pourcentage
/// =====================================================
class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String value;

  const _LegendItem({

    required this.color,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Pastille colorée
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 12),

        /// Nom de la catégorie
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        /// Pourcentage affiché
        Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}