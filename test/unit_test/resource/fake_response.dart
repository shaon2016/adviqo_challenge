const fakeDetailResponse = """
{
	"id": "MLU479145688",
	"price": 354,
	"title": "Notebook Hp Stream Nueva Y En Español Win10 64gb 4gb Ram Loi",
	"thumbnail": "http://http2.mlstatic.com/D_603880-MLU48233986823_112021-I.jpg"
}
""";

const fakeSearchResponse = """
{
	"paging": {
		"total": 12629,
		"primary_results": 1000,
		"offset": 0,
		"limit": 50
	},

	"results": [{
			"id": "MLU479145688",
			"title": "Notebook Hp Stream Nueva Y En Español Win10 64gb 4gb Ram Loi",
			"price": 354,
			"thumbnail": "http://http2.mlstatic.com/D_603880-MLU48233986823_112021-O.jpg"
		},
		{
			"id": "MLU604170084",
			"title": "Notebook Lenovo Ideapad S145-15iil Platinum Gray 15.6 , Intel Core I3 1005g1 12gb De Ram 1tb Hdd 128gb Ssd, Intel Uhd Graphics G1 1366x768px Windows 10 Home",
			"price": 799,
			"thumbnail": "http://http2.mlstatic.com/D_800653-MLA48265149903_112021-I.jpg"
		}
	]
}
""";
const fakeSearchResponseZeroResult = """
{
	"paging": {
		"total": 12629,
		"primary_results": 1000,
		"offset": 0,
		"limit": 50
	},

	"results": []
}
""";