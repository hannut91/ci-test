import { useState } from 'react';

export default function App() {
  const [count, setCount] = useState(0);

  const handleClick = () => {
    setCount((value) => value + 1);
  }
  
  return (
    <>
      <h1>Hell world!!!!222!</h1>

      <div>
        <p>카운트: {count}</p>
        <button onClick={handleClick} type="button">클릭!</button>
      </div>
    </>
  )
}
