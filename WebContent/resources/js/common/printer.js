//DLPrinter.MarginLeft = 20;//页眉整体距左 20px
//DLPrinter.MarginRight = 0;//
//DLPrinter.MarginTop = 5;//同上
//DLPrinter.MarginBottom = 5;//
//DLPrinter.CopyCount = 1; //打印张数
//DLPrinter.PageHeader = "";//页眉
//DLPrinter.PageFooter = "";//页脚
//DLPrinter.IsLandScape = 1;//是否是横向打印
//
//var dlPrintDirect = function(path) {
//	DLPrinter.ContentURL = protocol+"//"+domain+ctx+path;
//	DLPrinter.PrintDirect();
//};
//
//var dlPrintPreview = function(path) {
//	DLPrinter.ContentURL = protocol+"//"+domain+ctx+path;
//	DLPrinter.PrintPreview();
//};

var jqPrint = function(div) {
	$("#"+div).jqprint();
};