window.addEvent('domready', function(){
	//menuHover();
	//mainImgSlideShow();
	//slideUp();
	menuSlideLeft();
	//menuClick();
	//showFoodDetail();
	//mainBannerSlideShow();
	//customSelectBox();
	//customSelectBoxContact();
	//customSelectBoxBranches();
});

window.addEvent('load', function() {
	if($$('.showDate').length){
		new DatePicker('.showDate', {
			pickerClass: 'datepicker',
			allowEmpty: false,
			toggleElements: '.date_toggler'
		});
	}
	//showGoogleMap();
});

/*
function showGoogleMap(){
	var pImg = $('map_canvas');
	if(!pImg)	return;
	var points = $('mapPoint').value.split(',');
	var map = new GMap2(pImg);
	var point = new GLatLng(points[0], points[1]);
	map.setCenter(point, 17);
	map.setUIToDefault();
	
	var marker = new GMarker(point, {draggable: false});
	map.addOverlay(marker);
}
*/

function customSelectBox(){
	var selectBoxs = $$('.moo-select');
	if(!selectBoxs) return;
	if(selectBoxs.length > 0){		
		selectBoxs.each(function(select){	
			new MooSelect(select,{				
				hasMooScroll: false,
				optionShow: 5,
				maxWidth: 125,
				onSelect: function(li,selec,value){							
				}
			});			
		});
	}
}

/*
function customSelectBoxContact(){
	var selectBoxs = $$('.moo-selectContact');
	if(!selectBoxs) return;
	if(selectBoxs.length > 0){		
		selectBoxs.each(function(select){	
			new MooSelect(select,{				
					hasMooScroll: false,
					optionShow: 5,
					selectClass: 'moo-selectContact',
					plusWidth: 150,
					onSelect: function(li,selec,value){							
						if(selec.id == 'idContact'){
							new Request.HTML({
								url: 'index.php?option=com_contact&task=ajaxContact',
								method: 'post',
								data: {
									'idcontact': value
								},
								update: 'contactInformation',
								onComplete: function(){
									setTimeout(function(){
										showGoogleMap();									
									}, 100);
								}
							}).post();						
						}
					}
			});			
		});
	}
}
*/

function customSelectBoxBranches(){
	var selectBoxs = $$('.moo-selectBranches');
	if(!selectBoxs) return;
	if(selectBoxs.length > 0){		
		selectBoxs.each(function(select){	
			new MooSelect(select,{				
					hasMooScroll: false,
					optionShow: 5,
					selectClass: 'moo-selectContact',
					plusWidth: 150,
					onSelect: function(li,selec,value){							
					}
			});			
		});
	}
}




function menuHover(){
	var header = $('header');
	if(!header)	return;
	var ulMenu = header.getElement('ul.menu');
	if(!ulMenu)	return;
	var liTags = ulMenu.getElements('li');
	if(!liTags.length)	return;
	var divSub = $('subMenuFixPNG');
	if(!divSub)	return;
	
	var timer = null;
	liTags.each(function(liTag){
		var divSubMenu = liTag.getElement('div.subMenu');		
		if(divSubMenu){		
			liTag.removeEvents().addEvents({
				'mouseenter': function(){
					clearTimeout(timer);
					divSub.set('html', divSubMenu.get('html'));
					divSub.setStyles({
						left: liTag.getCoordinates().left
					});
				},
				'mouseleave': function(){
					timer = setTimeout(function(){
						divSub.setStyles({
							left: '-15000px'
						});
					}, 200);
				}
			});
			divSub.addEvents({
				'mouseenter': function(){
					clearTimeout(timer);					
				},
				'mouseleave': function(){
					divSub.setStyles({
						left: '-15000px'
					});
				}
			});
		}
	});
}

function mainImgSlideShow(){
	var divSlideShow = $('sliceImages');
	if(!divSlideShow)	return;
	var imgTags = divSlideShow.getElements('img');
	if(imgTags.length < 2)	return;
	
	var btnPre = divSlideShow.getNext('a.previousSliceButton');
	if(!btnPre)	return;
	var btnNext = btnPre.getNext('a.nextSliceButton');
	if(!btnNext)	return;
	
	imgTags.each(function(imgTag){
		imgTag.myFx = new Fx.Tween(imgTag,{
			property: 'opacity',
			duration: 2000,
			link: 'cancel'
		}).set(0);
	});	
	
	var maxImg = imgTags.length;
	var cur = 0;
	imgTags[cur].myFx.set(1);
	
	//set autofade
	var timeout = null;
	function setAutoFade(){
		return setInterval(function(){
			imgTags[cur++].myFx.start(0);
			if(cur == maxImg){
				cur = 0;
			}
			imgTags[cur].myFx.start(1);
		}, 5000);
	}
	timeout = setAutoFade();
	
	btnPre.removeEvents().addEvent('click', function(e){
		e.stop();
		timeout = clearInterval(timeout);
		imgTags[cur--].myFx.start(0);
		if(cur < 0){
			cur = maxImg - 1;
		}
		imgTags[cur].myFx.start(1);
		timeout = setAutoFade();
	});
	
	btnNext.removeEvents().addEvent('click', function(e){
		e.stop();		
		timeout = clearInterval(timeout);
		imgTags[cur++].myFx.start(0);
		if(cur == maxImg){
			cur = 0;
		}
		imgTags[cur].myFx.start(1);
		timeout = setAutoFade();
	});
}

function mainBannerSlideShow(){
	var divSlideShow = $('banner');
	if(!divSlideShow)	return;
	var imgTags = divSlideShow.getElements('img');
	if(imgTags.length < 2)	return;
	
	imgTags.each(function(imgTag){
		imgTag.myFx = new Fx.Tween(imgTag,{
			property: 'opacity',
			duration: 2000,
			link: 'cancel'
		}).set(0);
	});	
	
	var maxImg = imgTags.length;
	var cur = 0;
	imgTags[cur].myFx.set(1);
	
	setInterval(function(){
		imgTags[cur++].myFx.start(0);
		if(cur == maxImg){
			cur = 0;
		}
		imgTags[cur].myFx.start(1);
	},5000);
}

function slideUp(){
	var divs = $$('div.slideUp');
	if(!divs.length)	return;
	divs.each(function(div){
		div.myFx = new Fx.Tween(div,{
			property: 'top',
			duration: 300,
			link: 'cancel'
		}).set(425);
		div.removeEvents().addEvents({
			'mouseenter': function(){
				if(div.hasClass('slideUp')){				
					div.myFx.start(287);
					div.removeClass('slideUp')
				}
			},
			'mouseleave': function(){
				if(!div.hasClass('slideUp')){
					div.addClass('slideUp');
					div.myFx.start(425);				
				}
			}
		});
	});
}

function menuSlideLeft(){	
	var divSlides = $$('div.sliceMenu');
	if(!divSlides.length)	return;
	divSlides.each(function(divSlide, index) {
	    var ulTag = divSlide.getElement('ul');
	    var myFx = new Fx.Scroll(divSlide);

	    var liTags = ulTag.getElements('li');
	    var maxItem = liTags.length;
	    
	    var cur = 0;
	    if (index == 0) {
	        maxItem = maxItem - 3;
	    } else {
	        maxItem = maxItem - 1;
	    }

	    var btnPre = divSlide.getNext('a.previousButton');
	    var btnNext = divSlide.getNext('a.nextButton');

	    btnPre.setStyle('opacity', 0.01);
	    btnNext.setStyle('opacity', 0.01);
	    if (maxItem < 1) {
	        btnPre.setStyle('display', 'none');
	        btnNext.setStyle('display', 'none');
	        return;
	    }
	    btnNext.setStyle('opacity', 1);

	    btnPre.removeEvents().addEvent('click', function(e) {
	        e.stop();
	        if (cur == 0) {
	            return;
	        }
	        myFx.toElement(liTags[--cur]);
//	        alert("aaaa");
//	        alert(myFx);
//	        alert(cur);
	        if (cur == 0) {
	            btnPre.setStyle('opacity', 0.01);
	        } else {
	            btnPre.setStyle('opacity', 1);
	        }
	        btnNext.setStyle('opacity', 1);
	    });


	    btnNext.removeEvents().addEvent('click', function(e) {
	        e.stop();
	        if (cur == maxItem) {
	            return;
	        }
	        myFx.toElement(liTags[++cur]);
//	        alert("bbbbbbb");
//	        alert(myFx);
//	        alert(cur);
	        if (cur == maxItem) {
	            btnNext.setStyle('opacity', 0.01);
	        } else {
	            btnNext.setStyle('opacity', 1);
	        }
	        btnPre.setStyle('opacity', 1);
	    });
	});
}

function menuClick(){
	var div = $('leftSidebar');
	if(!div)	return;
	var ulTag = div.getElement('ul');
	if(!ulTag)	return;
	
	var curLi = ulTag.getElement('li.active');
	if(curLi){
	var ulSub = curLi.getElement('ul.subleftMenu');
		if(ulSub){
			ulSub.setStyle('display','block');
		}
	}
	
	var menuItems = ulTag.getElements('a');
	if(!menuItems.length)	return;
	menuItems.each(function(menuItem){
		menuItem.removeEvents().addEvent('click', function(e){			
			e.stop();
			if(curLi){
				curLi.removeClass('active');
			}
			curLi = this.getParent('li');
			curLi.addClass('active');
			
			$$('.subleftMenu').each(function(item){
				item.setStyle('display','none');
			});
			ulSub = menuItem.getNext('ul.subleftMenu');
			if(ulSub){
				ulSub.setStyle('display','block');
			}
		});		
	});
}

function showFoodDetail(){
	var div = $('main');
	if(!div)	return;
	var ulTag = div.getElement('ul.selectList');	
	if(!ulTag)	return;
	var aTagBtns = ulTag.getElements('a.selectItem');
	if(!aTagBtns.length)	return;
	var cur = 0;
	aTagBtns.each(function(aTagBtn, index){
		aTagBtn.removeEvents().addEvent('click', function(e){
			cur = index;
			e.stop();
			new Request.HTML({
				url: aTagBtn.get('href'),
				method: 'get',
				update: $('popupDetail').getElement('.contentPopup'),
				onRequest: function(){						
				},
				onComplete: function(){
					new MooLayer('popupDetail');
					$('popupDetail').getElement('a.nextSliceButton').removeEvents('click').addEvent('click',function(e){
						e.stop();
						if(cur+1 < aTagBtns.length){
							cur++;
							new Request.HTML({
								url: aTagBtns[cur].get('href'),
								method: 'get',
								update: $('popupDetail').getElement('.contentPopup'),
								onRequest: function(){				
								},
								onComplete: function(){							
								}
							}).send();
						}
					});
					$('popupDetail').getElement('a.previousSliceButton').removeEvents('click').addEvent('click',function(e){
						e.stop();
						if(cur > 0){
							cur--;
							new Request.HTML({
								url: aTagBtns[cur].get('href'),
								method: 'get',
								update: $('popupDetail').getElement('.contentPopup'),
								onRequest: function(){				
								},
								onComplete: function(){							
								}
							}).send();
						}
					});
				}
			}).send();
		});
	});
}

var MooLayer = new Class({
    Implements: [Options, Chain],
    options: {
        zIndex: 999,
        opacity: 0.6,
        padding: 0
    },
    initialize: function (selector,popupContentID, ajaxURL) {
        this.selector = $(selector);
		this.url = ajaxURL;
		this.updateDivID = $(popupContentID);
        if (!this.selector) return;
        this.initLayer(selector);
    },
    initLayer: function () {
        var that = this;
        var selector = this.selector;
		if($('overlayLayerPopup')){
			$('overlayLayerPopup').destroy();
		}
        var overlay = new Element('div', {
			'id': 'overlayLayerPopup',            
            'styles': {
                'display': 'block',
                'visibility': 'visible',
                'position': 'absolute',
                'top': 0,
                'left': 0,
                'width': window.getWidth(),
                'height': window.getScrollSize().y,
                'zIndex': that.options.zIndex,
                'backgroundColor': '#000',
                'opacity': that.options.opacity
            }
        }).inject(document.body);
		selector.inject(document.body);      
        selector.setStyles({            
            'position': 'absolute',
            'top': Math.max(0, (window.getHeight() - selector.getCoordinates().height) / 2 - that.options.padding) + window.getScrollTop(),
            'left': (window.getWidth() - selector.getCoordinates().width) / 2,
            'zIndex': that.options.zIndex + 1
        });
        
		var scrollTop = window.getScrollTop();
		
		
		if(this.url){
			new Request.HTML({
				url: this.url,
				method: 'get',		
				update: this.updateDivID,				
				onRequest: function(){		
				},
				onComplete: function(){
					selector.setStyles({
						'top': Math.max(0, (window.getHeight() - selector.getCoordinates().height) / 2 - that.options.padding) + window.getScrollTop(),
						'left': (window.getWidth() - selector.getCoordinates().width) / 2
					});
				}
			}).send();
		}
		
		window.addEvent('scroll',function(){
			if(window.getHeight() < selector.getCoordinates().height){					
				selector.setStyle('position', 'absolute');
				selector.setStyle('top' , scrollTop);	
				return true;
			}
			else {	
				selector.setStyle('position', (Browser.Engine.trident4 ? 'absolute': 'fixed'));
				if(Browser.Engine.trident4){
					selector.setStyle('top', Math.max(0, (window.getHeight() - selector.getCoordinates().height)/2 + (Browser.Engine.trident4 ? window.getScrollTop() : 0) - that.options.padding));
				}
				else{
					selector.setStyle('top', Math.max(0, (window.getHeight() - selector.getCoordinates().height)/2 + (Browser.Engine.trident4 ? window.getScrollTop() : 0) - that.options.padding));
				}
			}
		});
 
        window.addEvent('resize', function (e) {
            selector.setStyles({
                'top': Math.max(0, (window.getHeight() - selector.getCoordinates().height) / 2 - that.options.padding) + window.getScrollTop(),
                'left': (window.getWidth() - selector.getCoordinates().width) / 2
            });
        });

        if (selector.getElement('.closeButton')) {
            selector.getElement('.closeButton').removeEvents('click').addEvent('click', function (e) {
                if (e) e.stop();                
                selector.setStyle('top', '-15000px');
                overlay.destroy();
				window.removeEvents('scroll');
				window.removeEvents('resize');
            });
        }
    }
});

function submitForm(forms){	
	forms = $(forms);	
	forms.fireEvent('submit');
	return false;
}

function resetForm(forms){	
	forms = $(forms);	
	forms.reset();
	return false;
}
