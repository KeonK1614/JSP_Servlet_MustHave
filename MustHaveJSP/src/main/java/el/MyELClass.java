package el;

public class MyELClass {
	public String getGender(String jumin ) {
		String returnStr = ";";
		// 비교연산을 위해 정수로 반환한다.
		int beginIdx = jumin.indexOf("-") + 1;
		String genderStr = jumin.substring(beginIdx, beginIdx + 1);
		int genderInt = Integer.parseInt(genderStr);
		if (genderInt == 1 || genderInt == 3)
			returnStr = "남자";
		else if (genderInt == 2 || genderInt == 4)
			returnStr = "여자";
		else
			returnStr = "주민번호 오류입니다.";
		// 모든 문자가 숫자라면 true를 반환한다.
		return returnStr;
		
	}
	// 문자열이 숫자로만 이루어져 있는지 판단하는 정적메서드
	public static boolean isNumber (String value) {
		//String타입의 인수를 char형 배열로 반환한다.
		char[] chArr = value.toCharArray();
		//배열의 크기만큼 반복한다.
		for (int i = 0; i < chArr.length; i++) {
			//각 인덱스의 원소가 숫자인지 비교연산한다.
			if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
				//만약 숫자가 아니라면 즉시 false를 반환한다.
				return false;
			}
		}
		return true;
	}
	
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		try {
			sb.append("<table border='1'>");
			for (int i = 2; i <= limitDan; i++) {
				sb.append("<tr>");
				for (int j = 1; j<=9; j++) {
					sb.append("<td>" + i + " * " + j + "=" + (i * j) + "</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
