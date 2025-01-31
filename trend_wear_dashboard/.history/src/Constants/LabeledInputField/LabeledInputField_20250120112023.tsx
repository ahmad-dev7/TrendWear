import "./LabeledInputField.css";
interface Props {
  children: React.ReactNode;
}

const LabeledInputField = ({ children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>
      <input placeholder="₹" id="input-field" type="text" />
    </>
  );
};

export default LabeledInputField;
