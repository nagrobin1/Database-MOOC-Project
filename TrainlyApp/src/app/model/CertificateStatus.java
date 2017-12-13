package app.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="certificatestatus")
public class CertificateStatus {

	String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
