package tables;


public class Levrant�r {
	private String leverans�rId;
	private String namn;
	private String epost;
	String telefon;
	String gatuadress;
	String ort;
	private float provisionsniva;
	@Override
	public String toString() {
		return getNamn();
	}
	public String getLeverans�rId() {
		return leverans�rId;
	}
	public void setLeverans�rId(String leverans�rId) {
		this.leverans�rId = leverans�rId;
	}
	public String getNamn() {
		return namn;
	}
	public void setNamn(String namn) {
		this.namn = namn;
	}
	public String getEpost() {
		return epost;
	}
	public void setEpost(String epost) {
		this.epost = epost;
	}
	public float getProvisionsniva() {
		return provisionsniva;
	}
	public void setProvisionsniva(float provisionsniva) {
		this.provisionsniva = provisionsniva;
	}
	
	
	
}
