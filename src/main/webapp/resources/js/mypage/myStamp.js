const btn = document.querySelectorAll('.myStamp--couponbtn');
        const coupon = document.querySelectorAll('.myStamp--coupon');

        for (let i = 0; i < btn.length; i++) {
            btn[i].addEventListener('mouseover',
                function () {
                    coupon[i].style.width = '210px';
                    coupon[i].style.height = '200px';
                    coupon[i].style.padding ='35px';
                    coupon[i].style.boxShadow = '0 8px 20px rgba(0, 0, 0, 0.3)';
                    

                }
            );

            btn[i].addEventListener('mouseout',
                function () {
                    coupon[i].style.width = '200px';
                    coupon[i].style.height = '190px';
                    coupon[i].style.padding ='30px';  
                    coupon[i].style.boxShadow = 'none';
                }
            );
        }