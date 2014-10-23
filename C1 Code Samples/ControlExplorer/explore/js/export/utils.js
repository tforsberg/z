function saveFile(data, setting) {
    saveAs(data, getFileName(setting));
}

function getFileName(setting) {
    var fileName = setting.fileName;
    if (!fileName || !fileName.length) fileName = "test";
    switch (setting.exportFileType) {
        case wijmo.exporter.ExportFileType.Pdf:
            return fileName + ".pdf";
        case wijmo.exporter.ExportFileType.Xls:
            return fileName + ".xls";
        case wijmo.exporter.ExportFileType.Xlsx:
            return fileName + ".xlsx";
        case wijmo.exporter.ExportFileType.Csv:
            return fileName + ".csv";
        case wijmo.exporter.ExportFileType.Jpg:
            return fileName + ".jpg";
        case wijmo.exporter.ExportFileType.Bmp:
            return fileName + ".bmp";
        case wijmo.exporter.ExportFileType.Gif:
            return fileName + ".gif";
        case wijmo.exporter.ExportFileType.Tiff:
            return fileName + ".tiff";
        case wijmo.exporter.ExportFileType.Png:
            return fileName + ".png";
    }
    return fileName;
}