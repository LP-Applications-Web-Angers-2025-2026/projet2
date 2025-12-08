/**
 * Crée un graphique de performance comparant différentes méthodes
 * @param {string} containerId  - Sélecteur du conteneur (#container)
 * @param {object} dataset      - Données au format :
 * {
 *   CPUs: [],
 *   Methods: [
 *      { name:"", values:[...] }
 *   ]
 * }
 */
export function createPerformanceChart(containerId, dataset) {

    if (!dataset || !dataset.CPUs || !dataset.Methods) {
        console.error("Dataset invalide !");
        return;
    }

    // Transformer les données pour Highcharts
    const series = transformData(dataset);

    // Création du graphique
    $(containerId).highcharts({
        title: {
            text: 'Performance comparée des méthodes'
        },
        xAxis: {
            categories: dataset.Methods.map(m => m.name)  // Méthodes en bas
        },
        yAxis: {
            title: { text: 'Temps (ms)' }
        },
        legend: {
            title: { text: 'Cliquez pour afficher / cacher un CPU' }
        },
        series: series
    });
}

/**
 * Transforme les données afin que chaque CPU devienne une série
 * @param {object} dataset
 */
function transformData(dataset) {
    const cpuSeries = [];

    for (let cpuIndex = 0; cpuIndex < dataset.CPUs.length; cpuIndex++) {
        cpuSeries.push({
            name: dataset.CPUs[cpuIndex],
            data: dataset.Methods.map(m => m.values[cpuIndex]),
            visible: true
        });
    }
    return cpuSeries;
}

// Exemple d’utilisation :
// $(function () {
//     createPerformanceChart('#container', data);
// });
