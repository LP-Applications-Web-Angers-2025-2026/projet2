const fs = require('fs');
const path = require('path');

const pdfPath = path.resolve(__dirname, '../../../Programmation_Assembleur_x86_32_et_64_bits_sous_Linux_Ubuntu.pdf');
const outputDir = path.join(__dirname, 'output');

// Ensure output directory exists
if (fs.existsSync(outputDir)) {
    fs.rmSync(outputDir, {recursive: true, force: true});
}
fs.mkdirSync(outputDir);

async function parsePDF() {
    try {
        if (!fs.existsSync(pdfPath)) {
            throw new Error(`PDF file not found at: ${pdfPath}`);
        }

        const dataBuffer = fs.readFileSync(pdfPath);
        const {PDFParse} = require('pdf-parse');
        const parser = new PDFParse(new Uint8Array(dataBuffer));
        const data = await parser.getText();

        // Clean the text by removing page markers
        const cleanedText = (data.text || data)
            .split('\n')
            .filter(line => !line.match(/^\s*--\s*\d+\s*of\s*\d+\s*--\s*$/))
            .join('\n');

        const outputSingleFile = path.join(outputDir, 'programmation_assembleur.txt');

        console.log(`Writing cleaned content to ${outputSingleFile}...`);
        fs.writeFileSync(outputSingleFile, cleanedText);
        console.log("Done.");

    } catch (error) {
        console.error("Error parsing PDF:", error);
    }
}

parsePDF();
