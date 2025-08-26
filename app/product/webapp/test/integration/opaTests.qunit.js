sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'logaligruop/product/test/integration/FirstJourney',
		'logaligruop/product/test/integration/pages/ProductsList',
		'logaligruop/product/test/integration/pages/ProductsObjectPage',
		'logaligruop/product/test/integration/pages/ReviewsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage, ReviewsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('logaligruop/product') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage,
					onTheReviewsObjectPage: ReviewsObjectPage
                }
            },
            opaJourney.run
        );
    }
);