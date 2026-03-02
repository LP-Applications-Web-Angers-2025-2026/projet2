/**
 * graph.js  –  Graphique de performance (compatible Highcharts 3.x)
 *
 * Ce fichier est chargé comme un script classique (pas un module ES).
 * Il expose la fonction globale window.createPerformanceChart.
 *
 * @param {string} containerId  ID du conteneur HTML (sans #)
 * @param {object} dataset      Données JSON
 */
(function (global) {

    /**
     * Crée un graphique Highcharts comparant les méthodes par CPU.
     *
     * @param {string} containerId  ID de l'élément (sans #), ex: "chart-ch15-ancien-1"
     * @param {object} dataset
     *   {
     *     chapter: 15,
     *     title: "...",
     *     description: "...",
     *     CPUs: ["CPU1", ...],
     *     Years: [2015, ...],
     *     Methods: [{ name: "...", values: [float|null, ...] }, ...]
     *   }
     */
    function createPerformanceChart(containerId, dataset) {

        if (!dataset || !dataset.CPUs || !dataset.Methods) {
            console.error('createPerformanceChart: dataset invalide pour #' + containerId);
            return;
        }

        if (typeof Highcharts === 'undefined') {
            console.error('createPerformanceChart: Highcharts non chargé.');
            return;
        }

        // Étiquettes axe X = noms des méthodes
        var categories = dataset.Methods.map(function (m) { return m.name; });

        // Une série par CPU
        var series = dataset.CPUs.map(function (cpu, idx) {
            var year = dataset.Years ? dataset.Years[idx] : null;
            return {
                name: year ? cpu + ' (' + year + ')' : cpu,
                data: dataset.Methods.map(function (m) {
                    var v = m.values[idx];
                    return (v === null || v === undefined) ? null : parseFloat(v);
                }),
                connectNulls: false
            };
        });

        // Highcharts 3.x API : new Highcharts.Chart(id_string, config)
        new Highcharts.Chart({

            chart: {
                renderTo: containerId,   // ID sans '#'
                type: 'line',
                animation: true
            },

            title: {
                text: dataset.title || 'Performance comparée des méthodes'
            },

            subtitle: {
                text: dataset.description || ''
            },

            xAxis: {
                categories: categories,
                labels: {
                    rotation: -40,
                    align: 'right',
                    style: { fontSize: '10px' }
                },
                title: { text: 'Méthode' }
            },

            yAxis: {
                title: { text: 'Temps (s)' },
                min: 0
            },

            legend: {
                title: {
                    text: 'Cliquer pour afficher / cacher',
                    style: { fontWeight: 'normal', fontSize: '10px' }
                },
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            tooltip: {
                shared: false,
                formatter: function () {
                    var val = this.y !== null ? this.y.toFixed(3) + ' s' : 'N/A';
                    return '<b>' + this.series.name + '</b><br/>' + this.x + ': <b>' + val + '</b>';
                }
            },

            plotOptions: {
                line: {
                    marker: { enabled: true, radius: 3 }
                }
            },

            series: series,

            credits: { enabled: false }
        });
    }

    // Exposer globalement
    global.createPerformanceChart = createPerformanceChart;

})(window);
