package MyPack;

//public String toString( ){

//return "CoinName:" +name + "Network/Chain:" + network + " Market Value:" + marketValue + "Description: "+description;}

//}
//package MyBean;

import java.io.*; 
public class coinInfo implements Serializable{ 

private String name;
private	String network;
private String marketValue;
private	String description;
private	int vote;


public coinInfo() { 
} 
public coinInfo(String n,String na,String nam,String names,int v) 
{
	name=n;
	network=na;
	marketValue=nam;
	description=names;
	vote=v;
}

public void setName(String n){ 
name = n; } 

public void setNetwork(String a){ 
network = a; } 

public void setMarketValue(String n){ 
marketValue = n; } 

public void setDescription(String a){ 
description = a; }  
public void setVote(int v){ 
vote = v; }  


public String getName( ){ 
return name;} 

public String getNetwork( ){ 
return network; } 

public String getMarketValue( ){ 
return marketValue;} 

public String getDescription( ){ 
return description; } 

public int getVote( ){ 
return vote; } 
} // end class PersonInfo 