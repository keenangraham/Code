
        
           d3.json("datatest.json", function(error, Data) {
                   

            var rowsNeeded = Math.ceil(Data.length/10)

            var dataLength = d3.range(1, Data.length + 1)

            var x = 0
            var y = 0

            function countery() {
                y++;

            }

            function counterx() {
                x++;

            }


            var spr = 20;

            var parseDate = d3.time.format("%Y-%m-%d").parse;

            var formatTime = d3.time.format("%B %e, %Y");

            var tip = d3.tip()
                        .attr('class', 'd3-tip')
                        .offset([-20, 17])
                        .html(function(d) {
                            if (d.Positive === 1) {
                                return  "<strong>Order:</strong> <span style='color:#d95f02'>" + d.Order_ID  + "</span><br>" +
                                        "<strong>Date:</strong> <span style='color:#d95f02'>" + formatTime(parseDate(d.Date)) + "</span><br>" +
                                        "<strong>Ward Name:</strong> <span style='color:#d95f02'>" + d.Ward_Name + "</span><br>"+
                                        "<strong>Result:</strong> <span style='color:#d95f02'>" + d.Type + "</span><br>" +
                                        "<strong>Organism(s):</strong> <span style='color:#d95f02'>" + d.Organism + "</span>";
                            } else {
                                return  "<strong>Order:</strong> <span style='color:#b2df8a'>" + d.Order_ID  + "</span><br>" +
                                        "<strong>Date:</strong> <span style='color:#b2df8a'>" + formatTime(parseDate(d.Date)) + "</span><br>" +
                                        "<strong>Ward Name:</strong> <span style='color:#b2df8a'>" + d.Ward_Name + "</span><br>"+
                                        "<strong>Result:</strong> <span style='color:#b2df8a'>" + d.Type + "</span>";
                            }
                        });


        /*    var div = d3.select("body").append("div")   
                        .attr("class", "tooltip")               
                        .style("opacity", 0); */



            var canvas = d3.select("div")
                            .append("svg")
                            .attr("width", spr*41)
                            .attr("height", rowsNeeded*20);

            canvas.call(tip);

            var group = canvas.append("g")
                            .attr("transform", "translate(30, -75)");

            var samples = group.selectAll("circle")
                                .data(Data)
                                .enter()
                                .append("circle");

            var samplesAttr = samples
                                .attr("cx", function(d,i) {
                                if (i % spr === 0 && i != 0) {
                                    counterx()
                                    return ((i - (x*spr))* 40);
                                } else {
                                    return ((i - (x*spr))* 40);
                                }})
                                .attr("cy", function(d,i) { 
                                if (i % spr === 0 && i != 0) { 
                                    countery()
                                    return (y/2.7*100) + 100; 
                                } else { 
                                    return (y/2.7*100) + 100;
                                }})
                                .attr("r", 15)
                                .attr("stroke", "black")
                                .attr("stroke-width", 2)
                                .style("fill", function(d) { 
                                if (d.Positive === 1) { 
                                    return "#d95f02"; 
                                } else {
                                    return "#b2df8a";
                                }})
                    
                                .on("mouseover", function(d) { 
                                    d3.select(this)
                                    .style({fill:"#1f78b4"}); 
                                    tip.show(d);
                                })
                                .on("mouseout", function(d) { 
                                    d3.select(this)
                                    .style({fill: function(d) { 
                                if (d.Positive === 1) { 
                                    return "#d95f02"; 
                                } else {
                                    return "#b2df8a";
                                }}

                                    }); 
                                    tip.hide(d);
                                });
                                


                                
/*                                .on("mouseover", function(d) {      
                                                div.transition()        
                                                    .duration(50)      
                                                    .style("opacity", .9);      
                                                div.html(formatTime(parseDate(d.Date)) + "<br>" + d.Order_ID + "<br>" + d.Type)  
                                                    .style("left", (d3.event.pageX - 25) + "px")     
                                                    .style("top", (d3.event.pageY + 20) + "px");    
                                })                  
                                .on("mouseout", function(d) {       
                                                div.transition()        
                                                .duration(500)      
                                                .style("opacity", 0);   
                                });

*/                            

});

   

