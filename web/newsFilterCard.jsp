<%@page import="Model.newsUpdate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<newsUpdate> news = (List) request.getAttribute("newsFilter");
                                if (news != null) {
                                    int i = 1;
                                    String headline = null;
                                    String pic = "gen.jpg";
                                    for (newsUpdate n : news) {
                                        if(n.getNews_topic().length()>=40){
                                     headline = n.getNews_topic().substring(0, 36)+"...";
                                 }else{
                                     headline = n.getNews_topic();
                                 }
                                        if(n.getCate().equals("amb")){pic = "amb.jpg";}
                                 else if(n.getCate().equals("mtn")){pic = "mtn.jpg";}
                                 else if(n.getCate().equals("ads")){pic = "ads.jpg";}
                                 else{pic = "gen.jpg";}
                            %>

                            <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal<%=i%>">
                                <div class="white-panel pn white-header">
                                    <div class="white-header">
                                        <h5 style="color: #272b34;"><b><%=headline%></b></h5>
                                    </div>
                                    <div style="height: 155px;">
                                        <img src="<%=pic%>" style="height: 100%; width: 100%; object-fit: contain; padding-bottom: 20px;">
                                        <div class="white-panel pn white-header" style="height: 40px;">                                            
                                            <%if(n.isHidden()==false){%><form action="editNews" method="get" style='float:left;'><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/><input type="submit" value="edit" class="btn btn-warning"/></form><%}%>           
                                            <h5 style="color: #FF0000; float:left;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Expire on: <%=n.getEnd_date()%></b></h5>
                                            <form action="<%if(n.isHidden()){%>recycleNews<%}else{%>removeNews<%}%>" method="get" style='float:right;'><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/>
                                                <button type="submit" class="btn btn-danger"><%if(n.isHidden()){%>Recycle<%}else{%>Remove<%}%></button></form>
                                        </div>
                                    </div>

                                </div><! --/grey-panel -->
                            </div><!-- /col-md-3-->

                            <!-- Modal -->
                            <div class="modal fade" id="myModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel"><%=n.getNews_topic()%></h4>
                                        </div>
                                        <div class="modal-body">
                                            <%=n.getNews_desc()%>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                            <!-- เว้นนน -->

                            <%i++;%>

                            <%}
                            }%>