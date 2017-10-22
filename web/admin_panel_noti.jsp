<%@page import="Model.notifyAdmin"%>
<%@page import="java.util.List"%>
<div id="noti" style="display:none">
                            <% List<notifyAdmin> noti = notifyAdmin.getNotiInfo();
                               if(noti!=null){
                               for(notifyAdmin n : noti){
                            %>                            
                            <!-- /Notify Card -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted><%=n.getDatetime().substring(0, 19)%></muted><br/>
                                    <a href="#">Room: <%=n.getRoom()%></a> <b><%=n.getName()%></b> just <%=n.getMessage()%>
                                    on <b><%=n.getType()%>. </b><br/>
                                    </p>
                                </div>
                            </div>       
                            <%}}else{%>
                            <!-- /Notify Card -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>Up to date..</muted><br/>
                                    There's nothing to notify currently, Please check later!<br/>
                                    </p>
                                </div>
                            </div>
                            <%}%>
                            </div>